defmodule Calculator.Endpoint do
  use Phoenix.Endpoint, otp_app: :calculator

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart],
    pass: ["*/*"]

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session,
    store: :cookie,
    key: "_calculator_key",
    signing_salt: "calculator_signing_salt",
    encryption_salt: "calculator_encryption_salt"

  socket "/live", Phoenix.LiveView.Socket,
    websocket: true,
    longpoll: false

  plug Plug.Static,
    at: "/css",
    from: Path.join([:code.priv_dir(:calculator), "static", "css"]),
    gzip: false

  plug Calculator.Router
end

