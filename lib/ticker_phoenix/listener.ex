require Logger

defmodule TickerPhoenix.Listener do
  use GenServer


  ## Client API

  def start_link do
    Logger.info("Starting Quote Listener...")
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def notify(quotes) do
    GenServer.cast(__MODULE__, {:notify, quotes})
  end


  ## Server callbacks

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:notify, quotes}, state) do
    Logger.info("Listener => Quotes: #{inspect(quotes)}")
    {:noreply, state}
  end

end
