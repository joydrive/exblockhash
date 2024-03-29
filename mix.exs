defmodule Exblockhash.MixProject do
  use Mix.Project

  def project do
    [
      app: :exblockhash,
      version: "0.2.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:rustler, "~> 0.29.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
    ]
  end

  defp package() do
    [
      files: ~w(
        lib
        priv
        native
        .formatter.exs
        mix.exs
        README*
      )
    ]
  end
end
