defmodule Tennis do
  use Application.Behaviour

  def start(_type, _args), do: Tennis.Supervisor.start_link
  def score(player), do: Tennis.Worker.score(player)
  def restart, do: Tennis.Worker.restart
  def status, do: Tennis.Worker.status

end
