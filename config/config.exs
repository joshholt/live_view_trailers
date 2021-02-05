# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :idiot_box,
  ecto_repos: [IdiotBox.Repo]

# Configures the endpoint
config :idiot_box, IdiotBoxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "au+kSzx007E328ePSHTN3lmPJGItxD9oHoD44mEwdIar4icS08vaNkl4xDLb5FlE",
  render_errors: [view: IdiotBoxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: IdiotBox.PubSub,
  live_view: [signing_salt: "b+u2IwY7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
