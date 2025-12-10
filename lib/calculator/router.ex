defmodule Calculator.Router do
  use Phoenix.Router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
  end

  scope "/" do
    pipe_through :browser
    plug Plug.Static, at: "/css", from: Path.expand("priv/static/css", __DIR__), gzip: false
  end

  scope "/", CalculatorWeb do
    pipe_through :browser

    live "/", CalculatorLive, :index
  end
end

