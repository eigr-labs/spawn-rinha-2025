defmodule RinhaPayments.Actors.PaymentActor do
  @moduledoc """
  This module defines the Payment actor for handling payment-related operations.
  It uses the SpawnSdk.Actor for actor-based concurrency.
  """
  use SpawnSdk.Actor, name: "PaymentActor"
  require Logger

  alias Google.Protobuf.Empty
  alias Io.Eigr.Labs.Spawn.Rinha.Payment
  alias Io.Eigr.Labs.Spawn.Rinha.PaymentActorState

  import RinhaPayments.Payments.Client, only: [process_payment: 3]

  @default_url "http://payment-processor:8001/payments"
  @fallback_url "http://payment-processor-fallback:8002/payments"

  # Actor callbacks and other functions go here
  action("Payment", &handle_payment/2)

  defp handle_payment(%Context{} = ctx, %Payment{} = payment) do
    Logger.info("Handling payment: #{inspect(payment)}")

    case process_payment(payment, @default_url, @default_fee) do
      {:ok, amount, fee} ->
        Logger.info("Payment processed successfully via DEFAULT processor")

        new_state = %PaymentActorState{
          totalAmount: amount
        }

        Value.of()
        |> Value.state(new_state)
        |> Value.response(%Empty{})

      {:error, reason} ->
        Logger.warn("Default processor failed: #{inspect(reason)}. Trying FALLBACK...")

        case process_payment(payment, @fallback_url, @fallback_fee) do
          {:ok, amount, fee} ->
            Logger.info("Payment processed successfully via FALLBACK processor")

            new_state = %PaymentActorState{
              totalAmount: amount
            }

            Value.of()
            |> Value.state(new_state)
            |> Value.response(%Empty{})

          {:error, reason2} ->
            Logger.error("Fallback processor also failed: #{inspect(reason2)}")

            # Aqui poderia disparar métrica de inconsistência
            new_state = %PaymentActorState{
              totalAmount: 0.0
            }

            Value.of()
            |> Value.state(new_state)
            |> Value.response(%Empty{})
        end
    end
  end
end
