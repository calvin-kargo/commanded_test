defmodule BankAccount.Application do
  use Commanded.Application, otp_app: :commanded_test

  router BankAccount.Router
end
