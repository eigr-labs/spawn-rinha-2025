defmodule RinhaPayments.Payments.Client do
  @moduledoc """
  This module defines the Payment client for interacting with the Payment actor.
  """
  alias Io.Eigr.Labs.Spawn.Rinha.Payment

  def process_payment(%Payment{} = payment, url, _fee_rate) do
    requested_at =
      NaiveDateTime.utc_now()
      |> NaiveDateTime.truncate(:second)
      |> NaiveDateTime.to_iso8601()

    body = %{
      correlationId: payment.correlationId,
      amount: payment.amount,
      requestedAt: requested_at
    }

    case Req.post(url: url, json: body, receive_timeout: 2_000) do
      {:ok, %{status: code} = _resp} when code in 200..299 ->
        {:ok, 0.0, 0.0, requested_at}

      {:ok, %{status: code, body: resp_body}} ->
        {:error, {:http_error, code, resp_body}, requested_at}

      {:error, reason} ->
        {:error, reason, requested_at}
    end
  end
end
