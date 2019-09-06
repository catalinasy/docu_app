use Mix.Config

# Configure your database
config :docu_sign, DocuSign.Repo,
  username: "postgres",
  password: "postgres",
  database: "docu_sign_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :docu_sign, DocuSignWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
