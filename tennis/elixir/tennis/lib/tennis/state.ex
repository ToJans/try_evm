defmodule Tennis.State do
  use GenServer.Behaviour
  @worker_name :tennis_state

  def start_link do
    :gen_server.start_link({:local, @worker_name}, __MODULE__, [], [debug: [:trace, :statistics]])
  end

  def save(state) do
    :gen_server.cast(@worker_name, {:save, state})
  end

  def restore do
    :gen_server.call(@worker_name, :restore)
  end

  def init(_) do
    { :ok, nil }
  end

  def handle_cast({:save, state}, _current_state) do
    { :noreply, state }
  end

  def handle_call(:restore, _from, current_state) do
    { :reply, current_state, current_state }
  end
end
