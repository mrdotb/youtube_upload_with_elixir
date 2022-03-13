defmodule UploadWithElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :upload_with_elixir,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {UploadWithElixir.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:goth, "~> 1.3-rc"},
      {:hackney, "~> 1.17"},
      {:google_api_you_tube, "~> 0.40"}
    ]
  end
end
