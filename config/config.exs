# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :docu_sign,
  ecto_repos: [DocuSign.Repo]

# Configures the endpoint
config :docu_sign, DocuSignWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SqQF2t4YfI6IcdFj5BLtyM/bUJlZxe7GpT8GAB0a30ZiNY9jmKwXrrck8vw7EkTB",
  render_errors: [view: DocuSignWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DocuSign.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
