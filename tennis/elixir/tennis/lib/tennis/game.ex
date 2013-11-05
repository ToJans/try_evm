defmodule Tennis.Game do

  def score(player, game_state), do: next_game_state(player, game_state)

  defp next_game_state(_, state = [game: _]),  do: state

  defp next_game_state(player, :deuce),  do: [advantage: player]

  defp next_game_state(player, [advantage: player]), do: [game: player]
  defp next_game_state(player, [advantage: _]), do: :deuce

  defp next_game_state(:playerB, [playerA: 40, playerB: 30]), do: :deuce
  defp next_game_state(:playerA, [playerA: 30, playerB: 40]), do: :deuce

  defp next_game_state(:playerA, [playerA: 40, playerB: _]), do: [game: :playerA]
  defp next_game_state(:playerB, [playerA: _, playerB: 40]), do: [game: :playerB]

  defp next_game_state(player, game_state = [playerA: _, playerB: _]) do
    Keyword.update!(game_state, player, &new_player_score/1)
  end

  defp new_player_score(0), do: 15
  defp new_player_score(15), do: 30
  defp new_player_score(30), do: 40
end
