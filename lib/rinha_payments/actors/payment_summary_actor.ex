defmodule RinhaPayments.Actors.PaymentSummaryActor do
  @moduledoc """
  Payment actor responsável por processar uma única transação
  e registrar se foi processada via default, fallback ou falhou.
  """
  use SpawnSdk.Actor, name: "PaymentSummaryActor"
  require Logger

  alias Google.Protobuf.Empty
  alias Io.Eigr.Labs.Spawn.Rinha.Payment
  alias Io.Eigr.Labs.Spawn.Rinha.PaymentActorState
  alias Io.Eigr.Labs.Spawn.Rinha.PaymentSummaryProjection

  action("Summarize", &build_projection/2)

  defp build_projection(%Context{} = ctx, %PaymentActorState{}) do
    Value.of()
    #|> Value.state(state)
    |> Value.response(%Empty{})
  end
end

  