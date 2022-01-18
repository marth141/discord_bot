import Config

config :nostrum,
  token: "discord_token" # The token of your bot as a string

import_config "#{config_env()}.exs"
