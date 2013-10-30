defrecord Game, for: nil
defrecord Advantage, for: nil

defmodule Tennis.Game do

  def score(player, game_state), do: next_game_state(player, game_state)

  defp next_game_state(_, state = Game[for: _]),  do: state

  defp next_game_state(player, :deuce),  do: Advantage.new(for: player)

  defp next_game_state(player, Advantage[for: other_player]) when player != other_player, do: :deuce

  defp next_game_state(player, Advantage[for: _]), do: Game.new(for: player)

  defp next_game_state(:playerA, [playerA: x, playerB: y]) when x == 40 and y <= 30, do: Game.new(for: :playerA)
  defp next_game_state(:playerB, [playerA: x, playerB: y]) when x <= 30 and y == 40, do: Game.new(for: :playerB)

  defp next_game_state(:playerB, [playerA: x, playerB: y]) when x == 40 and y == 30, do: :deuce 
  defp next_game_state(:playerA, [playerA: x, playerB: y]) when x == 30 and y == 40, do: :deuce 

  defp next_game_state(player, game_state = [playerA: _, playerB: _]) do
    old_score = Keyword.get(game_state, player)
    Keyword.put(game_state, player, new_player_score(old_score)) |> Enum.sort
  end

  defp new_player_score(0), do: 15
  defp new_player_score(15), do: 30
  defp new_player_score(30), do: 40
end
