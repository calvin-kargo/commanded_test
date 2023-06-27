defmodule BankAccount.Event.BalanceAdded do
  @derive Jason.Encoder
  defstruct [:user_ksuid, :additional_balance, :note]
end
