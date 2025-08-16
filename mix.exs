defmodule RinhaPayments.MixProject do
  use Mix.Project

  def project do
    [
      app: :rinha_payments,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: releases()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {
        RinhaPayments.Application,
        []
      }
    ]
  end

  defp deps do
    [
      {:bakeware, "~> 0.2"},
      {:req, "~> 0.5.15"},
      {:spawn_sdk, "2.0.0-RC11"},
      {:spawn_statestores_mariadb, "2.0.0-RC11"},
      {:x509, "~> 0.9.2", override: true}
    ]
  end

  defp releases do
    [
      rinha_payments: [
        include_executables_for: [:unix],
        applications: [rinha_payments: :permanent],
        steps: [
          :assemble,
          &Bakeware.assemble/1
        ],
        bakeware: [compression_level: 19]
      ]
    ]
  end
end
