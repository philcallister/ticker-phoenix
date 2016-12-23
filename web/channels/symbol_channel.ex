require Logger

defmodule TickerPhoenix.SymbolChannel do
  @moduledoc """
  The symbol channel updates clients with a symbol's quote info
  """
  use Phoenix.Channel
  alias Ticker.TimeFrame

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

  def handle_in("all_frames", %{"symbol" => symbol, "interval" => interval}, socket) do
    frames = TimeFrame.get_frames(symbol, interval)
    {:reply, {:ok, %{frames: frames}}, socket}
  end

end
