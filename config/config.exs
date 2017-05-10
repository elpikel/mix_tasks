# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mix_tasks_manager,
  ecto_repos: [MixTasksManager.Repo]

# Configures the endpoint
config :mix_tasks_manager, MixTasksManager.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zl8d2SzRgn20IkQ8G2lSLRngPzYri/TcJLnCM9ta9hwZmBQ8aJA11enyEe5hzQLJ",
  render_errors: [view: MixTasksManager.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MixTasksManager.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [github: { Ueberauth.Strategy.Github, [] }]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "",
  client_secret: ""

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
