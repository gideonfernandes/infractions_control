# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :infractions_control,
  ecto_repos: [InfractionsControl.Repo]

# Configures the endpoint
config :infractions_control, InfractionsControlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WWLk0sNccw1jZdTliD+pjkru0aCcEeBOF9u5ZIzE1k5BizzwXMiLPXhFhf/cBAa7",
  render_errors: [view: InfractionsControlWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: InfractionsControl.PubSub,
  live_view: [signing_salt: "oo3TP8Gb"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :infractions_control, InfractionsControl.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
