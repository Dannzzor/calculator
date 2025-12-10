defmodule CalculatorWeb.LayoutView do
  use CalculatorWeb, :view

  def render("live.html", assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Calculator</title>
        <link rel="stylesheet" href="/css/app.css"/>
      </head>
      <body>
        <%= @inner_content %>
      </body>
    </html>
    """
  end
end

