defmodule BankAccount.Router do
  use Commanded.Commands.Router

  identify BankAccount.Aggregate.BankAccount, by: :user_ksuid
  dispatch [
    BankAccount.Command.EnsureAccountCreated,
    BankAccount.Command.AddBalance
  ], to: BankAccount.Aggregate.BankAccount
end
