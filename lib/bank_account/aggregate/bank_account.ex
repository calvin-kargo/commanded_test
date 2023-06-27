defmodule BankAccount.Aggregate.BankAccount do
  defstruct [:user_ksuid, :balance]

  # Public command API
  def execute(%BankAccount.Aggregate.BankAccount{} = bank_account, %BankAccount.Command.EnsureAccountCreated{} = command) do
    if bank_account.balance == nil do
      # Non-existing before, should create
      %BankAccount.Event.AccountCreated{user_ksuid: command.user_ksuid}
    else
      # Already existing, do nothing
      :ok
    end
  end

  def execute(%BankAccount.Aggregate.BankAccount{} = bank_account, %BankAccount.Command.AddBalance{} = command) do
    if bank_account.balance == nil do
      # Non-existing before, return error
      {:error, :bank_account_not_exist}
    else
      # Dispatch add balance event
      %BankAccount.Event.BalanceAdded{
        user_ksuid: command.user_ksuid,
        additional_balance: command.additional_balance,
        note: command.note
      }
    end
  end

  # State mutators
  def apply(%BankAccount.Aggregate.BankAccount{} = bank_account, %BankAccount.Event.AccountCreated{} = event) do
    %BankAccount.Aggregate.BankAccount{bank_account |
      user_ksuid: event.user_ksuid,
      balance: 0
    }
  end

  def apply(%BankAccount.Aggregate.BankAccount{} = bank_account, %BankAccount.Event.BalanceAdded{} = event) do
    %BankAccount.Aggregate.BankAccount{bank_account |
      balance: bank_account.balance + event.additional_balance
    }
  end
end
