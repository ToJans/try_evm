defmodule Tennis.State do
  use ExActor, export: :tennis_state

  defcast save(state) do
    new_state(state)
  end

  defcall restore, state: current_state do
    reply(current_state, current_state)
  end

end
