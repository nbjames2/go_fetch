# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :go_fetch, GoFetchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "k5kZ5fHsw39m9teR3fzDJLb3/I68OoEmkarLTPXT/4epucDNQ0YjiY9jaAw/2bDc",
  render_errors: [view: GoFetchWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GoFetch.PubSub,
  live_view: [signing_salt: "j26sZeBa"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Poison

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
