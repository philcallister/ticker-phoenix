defmodule TickerPhoenix.Mixfile do
  use Mix.Project

  def project do
    [app: :ticker_phoenix,
     version: "0.0.1",
     elixir: "~> 1.8",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {TickerPhoenix, []},
     applications: [:phoenix, :phoenix_pubsub, :cowboy, 
                    :logger, :gettext, :corsica, :ticker]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.1"},
     {:phoenix_pubsub, "~> 1.0"},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:plug_cowboy, "~> 1.0"},
     {:corsica, "~> 1.1.2"},
     {:ticker, git: "https://github.com/philcallister/ticker-elixir.git", branch: "elixir_1.8_iex"},
     {:poison, "~> 3.1", override: true}
    ]
  end
end
