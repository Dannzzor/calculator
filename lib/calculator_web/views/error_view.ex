defmodule CalculatorWeb.ErrorView do
  use Phoenix.Component

  def render("404.html", assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>404 - Page Not Found</title>
        <link rel="stylesheet" href="/css/app.css"/>
      </head>
      <body>
        <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh; flex-direction: column;">
          <h1>404</h1>
          <p>Page not found</p>
          <a href="/" style="margin-top: 20px; color: #667eea;">Go to Calculator</a>
        </div>
      </body>
    </html>
    """
  end

  def render("500.html", assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>500 - Internal Server Error</title>
        <link rel="stylesheet" href="/css/app.css"/>
      </head>
      <body>
        <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh; flex-direction: column;">
          <h1>500</h1>
          <p>Internal server error</p>
          <a href="/" style="margin-top: 20px; color: #667eea;">Go to Calculator</a>
        </div>
      </body>
    </html>
    """
  end

  def render(_template, assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Error</title>
        <link rel="stylesheet" href="/css/app.css"/>
      </head>
      <body>
        <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh; flex-direction: column;">
          <h1>Error</h1>
          <p>An error occurred</p>
          <a href="/" style="margin-top: 20px; color: #667eea;">Go to Calculator</a>
        </div>
      </body>
    </html>
    """
  end
end

