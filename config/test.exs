use Mix.Config

# Configure your database
config :not_twitter, NotTwitter.Repo,
  username: "postgres",
  password: "postgres",
  database: "not_twitter_test",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :not_twitter_web, NotTwitterWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
