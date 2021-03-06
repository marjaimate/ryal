defmodule Ryal.Mixfile do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.0.1",
      build_embedded: Mix.env == :prod,
      description: "An e-commerce library for elixir.",
      deps: deps(),
      package: package(),
      start_permanent: Mix.env == :prod
    ]
  end

  def application do
    [applications: [:ryal_core, :logger]]
  end

  defp deps do
    [
      {:ryal_core, path: "apps/ryal_core", from_umbrella: true, env: Mix.env},

      {:dummy, path: "apps/ryal_core/test/support/dummy", optional: true},
      {:stripity_stripe, github: "code-corps/stripity_stripe", optional: true}
    ]
  end

  defp package do
    [
      maintainers: ["Ben A. Morgan"],
      licenses: ["MIT"],
      links: %{"github" => "https://github.com/ryal/ryal"},
      files: [
        "mix.exs",
        "README.md"
      ]
    ]
  end
end
