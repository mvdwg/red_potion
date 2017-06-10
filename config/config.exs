# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :red_potion,
  ecto_repos: [RedPotion.Repo]

# Configures the endpoint
config :red_potion, RedPotion.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QYXnf26fjGJommRV8H7C2M/G5r0kX1RN0IYy0iZ1uuOpzv+N+6IAzYZnTq9ZM2M2",
  render_errors: [view: RedPotion.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RedPotion.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
