defmodule CalculatorWeb.LayoutView do
  use Phoenix.Component

  def render("live.html", assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Calculator</title>
        <link rel="stylesheet" href="/css/app.css"/>
        <script src="https://cdn.jsdelivr.net/npm/phoenix@1.7.21/priv/static/phoenix.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/phoenix_live_view@0.20.17/priv/static/phoenix_live_view.min.js"></script>
        <script>
          (function() {
            function initLiveView() {
              if (typeof LiveView === 'undefined' || typeof Phoenix === 'undefined') {
                setTimeout(initLiveView, 50)
                return
              }
              let Hooks = {}
              // Get CSRF token from the LiveView data attribute
              let phxMain = document.querySelector("[data-phx-main]")
              let csrfToken = null
              if (phxMain) {
                let sessionData = phxMain.getAttribute("data-phx-session")
                if (sessionData) {
                  try {
                    // The session is base64 encoded, decode and parse to get CSRF token
                    // For now, we'll let LiveView handle it automatically
                    csrfToken = ""
                  } catch(e) {}
                }
              }
              // LiveView will automatically get the CSRF token from the session
              let liveSocket = new LiveView.LiveSocket("/live", Phoenix.Socket, {
                params: {},
                hooks: Hooks
              })
              liveSocket.connect()
              window.liveSocket = liveSocket
            }
            if (document.readyState === 'loading') {
              document.addEventListener('DOMContentLoaded', initLiveView)
            } else {
              initLiveView()
            }
          })()
        </script>
      </head>
      <body>
        <%= @inner_content %>
      </body>
    </html>
    """
  end
end

