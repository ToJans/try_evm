defrecord GameState.Won,  by: nil

defmodule Tennis.Game do
  def score(player, game_state = [playerA: _, playerB: _]) do
    next_game_state(player, game_state)
  end

  defp next_game_state(player, [playerA: x, playerB: y]) when x == 40 and y <= 30 or x <= 30 and y == 40 do
    GameState.Won.new(by: player)
  end

  defp next_game_state(player, game_state) do
    old_score = Keyword.get(game_state, player)
    Keyword.put(game_state, player, new_player_score(old_score)) |> Enum.sort
  end

  defp new_player_score(score) do
    case score do
      0  -> 15
      15 -> 30
      30 -> 40
    end
  end
end
