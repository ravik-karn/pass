# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config


# General drab coonection
config :phoenix, :template_engines,
  drab: Drab.Live.Engine

  
# General application configuration
config :pass,
  ecto_repos: [Pass.Repo]

# Configures the endpoint
config :pass, PassWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VKkQYEMk/RAt8brIvyNC9RfiLE8NOPLIzEkfJrbRSa8iePkByR9X7G7uWe/ofA6u",
  render_errors: [view: PassWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pass.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
