require Logger

defmodule SocketBroadcast.SymbolChannel do
  @moduledoc """
  The symbol channel updates clients with a symbol's quote info
  """
  use Phoenix.Channel

  def join("symbol:" <> symbol, _parms, socket) do
    Logger.info("Joining: #{symbol}")
    {:ok, socket}
  end

end
