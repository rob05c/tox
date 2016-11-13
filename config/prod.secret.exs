use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :tox, Tox.Endpoint,
  secret_key_base: "U3+mFFT8M4weWvfqCON3x5Av1Pluw+2jNSdoXTWihkwciNzWnIxRocCO8KRjC8J2"

# Configure your database
config :tox, Tox.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "tox_prod",
  pool_size: 20
