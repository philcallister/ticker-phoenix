require Logger

defmodule TickerPhoenix.Listener do
  use GenServer


  ## Client API

  def start_link do
    Logger.info("Starting Quote Listener...")
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def notify_quotes(quotes) do
    GenServer.cast(__MODULE__, {:notify_quotes, quotes})
  end

  def notify_frame(frame) do
    GenServer.cast(__MODULE__, {:notify_frame, frame})
  end


  ## Server callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:notify_quotes, quotes}, state) do
    Enum.each(quotes, fn(q) -> notify_of_quote(q) end)
    {:noreply, state}
  end

  def handle_cast({:notify_frame, frame}, state) do
    notify_of_frame(frame)
    {:noreply, state}
  end

  defp notify_of_quote(quote) do
    TickerPhoenix.Endpoint.broadcast!("quote:symbol:#{quote.t}", "quote", quote)
  end

  defp notify_of_frame(frame) do
    TickerPhoenix.Endpoint.broadcast!("frame:symbol:#{frame.symbol}:#{frame.interval}", "frame", frame)
  end

end
