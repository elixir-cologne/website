# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :website, Website.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "rj1eMftmGTN3SIkkDuxX3SU0kPkti4LaNFoFcrLaAFOg/WVwsc8VY3OFBXBTliWI",
  render_errors: [default_format: "html"],
  pubsub: [name: Website.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :website, admins: ["tim@buchwaldt.ws"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
