import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hydrate_truck_club, HydrateTruckClubWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "l4Xtknn5cYv9VMIQtddJYmsbxqhT/6zHXR4lAQZkCGI4WXQhR7m5ITpiQL1R1Xxf",
  server: false

# In test we don't send emails.
config :hydrate_truck_club, HydrateTruckClub.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
