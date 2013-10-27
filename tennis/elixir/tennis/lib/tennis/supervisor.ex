defmodule Tennis.Supervisor do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Tennis.State, []),
      worker(Tennis.Worker, [])
    ]

    supervise children, strategy: :one_for_one
  end
end
