defmodule Calculator.Router do
  use Phoenix.Router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
  end

  scope "/", CalculatorWeb do
    pipe_through :browser

    live "/", CalculatorLive, :index
  end
end

