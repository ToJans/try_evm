defmodule Tennis.Worker do
  use GenServer.Behaviour
  @worker_name :tennis_worker
  @initial_state [playerA: 0, playerB: 0]

  def start_link do
    :gen_server.start_link({:local, @worker_name}, __MODULE__, [], [debug: [:trace, :statistics]])
  end

  def score(player) do
    :gen_server.call(@worker_name, {:score, player})
  end

  def status do
    :sys.get_status @worker_name
  end

  def restart do
    :gen_server.cast(@worker_name, :restart)
  end

  def init(_) do
    { :ok, @initial_state }
  end

  def handle_call({:score, player}, _from, current_state) do
    next_state = Tennis.Game.score(player, current_state)
    { :reply, next_state, next_state }
  end

  def handle_cast(:restart, _current_state) do
    { :noreply, @initial_state }
  end

  def format_status(_reason, [ _pdict, state ]) do
    [data: [{'State', "The current game state is '#{inspect state}'"}]]
  end
end
