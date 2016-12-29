defmodule LetsencryptPlug.Mixfile do
  use Mix.Project

  def project do
    [
      app: :letsencrypt_plug,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      preferred_cli_env: ["test.watch": :test],
      deps: deps()
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:plug, "~> 1.3"},
      {:mix_test_watch, "~> 0.2", only: :test},
    ]
  end
end
