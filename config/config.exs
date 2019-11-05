# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

import_config "elastic_apm.exs"

# Configure Mix tasks and generators
config :diy_twitter,
  ecto_repos: [DiyTwitter.Repo]

config :diy_twitter_web,
  ecto_repos: [DiyTwitter.Repo],
  generators: [context_app: :diy_twitter],
  loggers: [{Ecto.LogEntry, :log, []},
            {ElasticAPM.Instruments.EctoLogger, :log, []}]

# Configures the endpoint
config :diy_twitter_web, DiyTwitterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4MYtNU4mz2sy/7ZTlGbrKTqhrUecAINE5hEnm7ypQxHe+UvZeUOcXQg5kso7/kbX",
  render_errors: [view: DiyTwitterWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DiyTwitterWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines,
  eex: ElasticAPM.Instruments.EExEngine,
  exs: ElasticAPM.Instruments.ExsEngine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
