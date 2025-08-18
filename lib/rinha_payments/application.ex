defmodule RinhaPayments.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {
        SpawnSdk.System.Supervisor,
        system: "rinha-system",
        actors: [
          RinhaPayments.Actors.PaymentActor,
          RinhaPayments.Actors.PaymentSummaryActor
        ]
      }
    ]

    opts = [strategy: :one_for_one, name: RinhaPayments.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
