defmodule CommandedTest.Application do
  use Application

  def start(_type, _args) do
    children = [
      BankAccount.Application
    ]

    opts = [strategy: :one_for_one, name: CommandedTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
