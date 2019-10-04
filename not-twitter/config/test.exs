use Mix.Config

# Configure your database
config :diy_twitter, DiyTwitter.Repo,
  username: "postgres",
  password: "postgres",
  database: "diy_twitter_test",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :diy_twitter_web, DiyTwitterWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
