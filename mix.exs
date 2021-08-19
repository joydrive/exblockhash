defmodule Exblockhash.MixProject do
  use Mix.Project

  def project do
    [
      app: :exblockhash,
      version: "0.1.0",
      elixir: "~> 1.12-rc",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.22.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      files: ~w(lib priv native .formatter.exs mix.exs README* readme* LICENSE*
                license* CHANGELOG* changelog* src)
    ]
  end
end
