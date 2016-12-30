# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tox,
  ecto_repos: [Tox.Repo]

# Configures the endpoint
config :tox, Tox.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VlTkBCswGfbfIn/HIqm58FPSchJ9IqH39YP0hv6CVVtugAMYuZb7sfBq6i2x9Yuf",
  render_errors: [view: Tox.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tox.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Tox",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  serializer: Tox.GuardianSerializer,
  secret_key: "A99CAEEA-0AC0-4DCC-9859-247D03C5D6CB"
