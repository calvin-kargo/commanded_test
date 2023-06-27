# config/config.exs
import Config

config :commanded_test, BankAccount.EventStore,
  serializer: EventStore.JsonSerializer,
  column_data_type: "jsonb",
  types: EventStore.PostgresTypes,
  username: "postgres",
  password: "postgres",
  database: "commanded_test_local",
  hostname: "DESKTOP-Q53DH65.mshome.net"
