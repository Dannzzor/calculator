import Config

config :calculator,
  ecto_repos: []

# Static files configuration
config :calculator, :static_paths, ["priv/static"]

config :calculator, Calculator.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "a_very_long_secret_key_base_that_should_be_at_least_64_characters_long_for_production_use",
  live_view: [signing_salt: "calculator_live_view_salt"],
  http: [port: 4000],
  server: true,
  render_errors: [
    view: CalculatorWeb.ErrorView,
    accepts: ~w(html),
    layout: false
  ]

