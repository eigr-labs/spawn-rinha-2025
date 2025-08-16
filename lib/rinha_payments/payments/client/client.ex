defmodule RinhaPayments.Payments.Client do
  @moduledoc """
  This module defines the Payment client for interacting with the Payment actor.
  """
  alias Io.Eigr.Labs.Spawn.Rinha.Payment

  def process_payment(%Payment{} = payment, url, fee_rate) do
    body = %{
      correlationId: payment.correlationId,
      amount: payment.amount,
      requestedAt:
        NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second) |> NaiveDateTime.to_iso8601()
    }

    case Req.post(url: url, json: body, receive_timeout: 2_000) do
      {:ok, %{status: code} = _resp} when code in 200..299 ->
        {:ok, 0.0, 0.0}

      {:ok, %{status: code, body: resp_body}} ->
        {:error, {:http_error, code, resp_body}}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
