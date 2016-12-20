require Logger

defmodule TickerPhoenix.SymbolChannel do
  @moduledoc """
  The symbol channel updates clients with a symbol's quote info
  """
  use Phoenix.Channel

  # Join example: "quote:symbol:TSLA"
  def join("quote:symbol:" <> symbol, _params, socket) do
    Logger.info("Joining Quote: #{symbol}")
    {:ok, socket}
  end

  # Join example: "frame:symbol:TSLA:1"
  def join("frame:symbol:" <> symbol_interval, _params, socket) do
    [symbol, interval] = String.split(symbol_interval, ":")
    Logger.info("Joining Frame: #{symbol} | Interval: #{interval}")
    {:ok, socket}
  end

end
