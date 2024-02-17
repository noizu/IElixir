defmodule IElixir.Mixfile do
  use Mix.Project

  @version "0.9.21"

  def project do
    [
      app: :ielixir,
      version: @version,
      source_url: "https://github.com/pprzetacznik/IElixir",
      name: "IElixir",
      elixir: ">= 1.10.3",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      consolidate_protocols: false,
      deps: deps(),
      description: """
      Jupyter's kernel for Elixir programming language
      """,
      package: package(),
prune_code_paths: false,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [mod: {IElixir, []}, applications: [:logger, :iex, :ecto, :ecto_sql, :erlzmq, :poison, :floki, :ecto_sqlite3]]
  end

  def elixirc_paths(:test), do: ["lib","test/support"] # future proof
  def elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:erlzmq, "~> 3.0"},
      {:floki, "~> 0.29.0"},
      {:poison, "~> 3.0"},
      {:uuid_erl, "~> 1.7.5", app: false},
      {:ecto_sqlite3, "~> 0.13"},

      # Docs dependencies
      {:earmark, "~> 1.3.2", only: :docs},
      {:ex_doc, "~> 0.23", only: :docs, runtime: false},
      {:inch_ex, "~> 2.0.0", only: :docs},
      {:ssl_verify_fun, "~> 1.1.7", overide: true},
      {:plug_crypto, "~> 2.0.0", override: true}, 
      # Test dependencies
      {:excoveralls, "~> 0.13.3", only: :test},
{:db_connection, "~> 2.6", override: true}
    ]
  end

  defp package do
    [
      files: [
        "config",
        "lib",
        "priv",
        "resources",
        "mix.exs",
        "README.md",
        "LICENSE",
        "install_script.sh",
        "start_script.sh",
        ".travis.yml"
      ],
      exclude_patterns: ["resources/.ipynb_checkpoints", "resources/macro.ex"],
      maintainers: ["Piotr Przetacznik"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/pprzetacznik/ielixir",
        "Docs" => "http://hexdocs.pm/ielixir/"
      }
    ]
  end
end
