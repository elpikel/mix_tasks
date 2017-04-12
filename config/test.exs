use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mix_tasks_manager, MixTasksManager.Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :mix_tasks_manager, MixTasksManager.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "mix_tasks_manager_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
