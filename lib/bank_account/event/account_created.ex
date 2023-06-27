defmodule BankAccount.Event.AccountCreated do
  @derive Jason.Encoder
  defstruct [:user_ksuid]
end
