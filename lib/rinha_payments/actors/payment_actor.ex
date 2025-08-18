defmodule RinhaPayments.Actors.PaymentActor do
  @moduledoc """
  Payment actor responsável por processar uma única transação
  e registrar se foi processada via default, fallback ou falhou.
  """
  use SpawnSdk.Actor, name: "PaymentActor"
  require Logger

  alias Google.Protobuf.Empty
  alias Io.Eigr.Labs.Spawn.Rinha.Payment
  alias Io.Eigr.Labs.Spawn.Rinha.PaymentActorState

  import RinhaPayments.Payments.Client, only: [process_payment: 3]

  @default_url "http://payment-processor:8080/payments"
  @fallback_url "http://payment-processor-fallback:8080/payments"

  @default_fee 0.01
  @fallback_fee 0.02

  @processors [
    {:default, @default_url, @default_fee},
    {:fallback, @fallback_url, @fallback_fee}
  ]

  action("Payment", &handle_payment/2)

  defp handle_payment(%Context{state: %PaymentActorState{} = state}, %Payment{}) do
    Logger.debug("Payment already processed. Actual state is: #{inspect(state)}")

    Value.of()
    |> Value.state(state)
    |> Value.response(%Empty{})
  end

  defp handle_payment(%Context{} = _ctx, %Payment{} = payment) do
    Logger.info("Handling payment: #{inspect(payment)}")

    case try_processors(payment, @processors, %{default: 0, fallback: 0}) do
      {:ok, amount, :default, attempts, requested_at} ->
        build_response(amount, 0.0, attempts, requested_at, "DEFAULT")

      {:ok, amount, :fallback, attempts, requested_at} ->
        build_response(0.0, amount, attempts, requested_at, "FALLBACK")

      {:error, :all_failed, attempts, requested_at} ->
        build_response(0.0, 0.0, attempts, requested_at, "ALL FAILED", :error)
    end
  end

  defp build_response(
         total_amount,
         fallback_amount,
         attempts,
         requested_at,
         label,
         level \\ :info
       ) do
    log_fun = if level == :error, do: &Logger.error/1, else: &Logger.info/1
    log_fun.("Payment processed result: #{label}")

    new_state = %PaymentActorState{
      total_amount: total_amount,
      total_fallback_amount: fallback_amount,
      default: attempts.default,
      fallback: attempts.fallback,
      requested_at: requested_at
    }

    Value.of()
    |> Value.state(new_state)
    |> Value.response(%Empty{})
  end

  defp try_processors(_payment, [], attempts) do
    {:error, :all_failed, attempts, DateTime.utc_now()}
  end

  defp try_processors(payment, [{:default, url, fee} | rest], attempts) do
    case process_payment(payment, url, fee) do
      {:ok, amount, _fee, requested_at} ->
        {:ok, amount, :default, %{attempts | default: attempts.default + 1}, requested_at}

      {:error, reason, _requested_at} ->
        Logger.warning("Processor DEFAULT (#{url}) failed: #{inspect(reason)}. Trying next...")
        try_processors(payment, rest, %{attempts | default: attempts.default + 1})
    end
  end

  defp try_processors(payment, [{:fallback, url, fee} | rest], attempts) do
    case process_payment(payment, url, fee) do
      {:ok, amount, _fee, requested_at} ->
        {:ok, amount, :fallback, %{attempts | fallback: attempts.fallback + 1}, requested_at}

      {:error, reason, _requested_at} ->
        Logger.warning("Processor FALLBACK (#{url}) failed: #{inspect(reason)}. Trying next...")
        try_processors(payment, rest, %{attempts | fallback: attempts.fallback + 1})
    end
  end
end
