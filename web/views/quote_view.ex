defmodule TickerPhoenix.QuoteView do
  use TickerPhoenix.Web, :view

  def render("show.json", %{quote: quote}) do
    %{data: render_one(quote, TickerPhoenix.QuoteView, "quote.json")}
  end

  def render("quote.json", %{quote: quote}) do
    Poison.encode!(quote)
  end
end
