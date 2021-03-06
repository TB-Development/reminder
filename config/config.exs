# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :reminder,
  ecto_repos: [Reminder.Repo]

# Configures the endpoint
config :reminder, ReminderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8sKLuyat+hRaESnmSSfbRiU70E4/neF6kKRQPN9lhsFpqwYfFKnXHYnrBumzmFpq",
  render_errors: [view: ReminderWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Reminder.PubSub,
  live_view: [signing_salt: "ZVTmtKal"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
