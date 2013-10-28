defmodule Tennis.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    options = [debug: [:trace]]

    children = [
      worker(Tennis.State, [nil, options]),
      worker(Tennis.Worker,[nil, options])
    ]

    supervise children, strategy: :one_for_one
  end
end
