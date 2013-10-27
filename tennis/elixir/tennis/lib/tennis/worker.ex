defmodule Tennis.Worker do
  use ExActor, export: :tennis_worker

  @initial_state [playerA: 0, playerB: 0]

  definit do
    Tennis.State.restore || @initial_state
  end

  defcall score(player), state: current_state do
    next = Tennis.Game.score(player, current_state)
    reply(next, next)
  end

  defcall status, state: current_state do
    reply(current_state, current_state)
  end

  defcast restart do
    new_state(@initial_state)
  end

  def terminate(_reason, current_state) do
    current_state |> Tennis.State.save
  end
end
