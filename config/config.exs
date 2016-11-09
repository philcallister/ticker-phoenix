# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :ticker_phoenix, TickerPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qBszhW07AjCt7Ga/msdHQCo+ueexMtVsjgLE48BDrn+C/08vtXdBoGvRpKgz/IWJ",
  render_errors: [view: TickerPhoenix.ErrorView, accepts: ~w(json)],
  pubsub: [name: TickerPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :ticker,
  frequency: 5_000,
  processor: Ticker.Quote.Processor.Simulate,
  symbols: ["TSLA", "GOOG", "AAPL", "TWTR", "FB", "MMM", "GLD", "VOO"],
  url: "http://finance.google.com/finance/info?client=ig&q=NASDAQ%3A",
  notify_module: TickerPhoenix.Listener,
  notify_fn: :notify


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
