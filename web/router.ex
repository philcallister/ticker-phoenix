defmodule TickerPhoenix.Router do
  use TickerPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TickerPhoenix do
    pipe_through :api

    get "/quotes/:symbol/show", QuoteController, :show
  end
end
