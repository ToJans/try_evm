defmodule Tennis.Game do

  def score(player, game_state), do: next_game_state(player, game_state)

  defp next_game_state(_, state = [game: _]),  do: state

  defp next_game_state(player, :deuce),  do: [advantage: player]

  defp next_game_state(player, [advantage: other_player]) when player != other_player, do: :deuce

  defp next_game_state(player, [advantage: _]), do: [game: player]

  defp next_game_state(:playerA, [playerA: x, playerB: y]) when x == 40 and y <= 30, do: [game: :playerA]
  defp next_game_state(:playerB, [playerA: x, playerB: y]) when x <= 30 and y == 40, do: [game: :playerB]

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
