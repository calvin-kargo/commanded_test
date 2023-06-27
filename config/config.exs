# config/config.exs
import Config

config :commanded_test, BankAccount.Application,
  event_store: [
    adapter: Commanded.EventStore.Adapters.EventStore,
    event_store: BankAccount.EventStore
  ],
  pubsub: :local,
  registry: :local

config :commanded_test, event_stores: [BankAccount.EventStore]
