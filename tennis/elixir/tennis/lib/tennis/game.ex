defrecord Game, for: nil

defmodule Tennis.Game do

  def score(player, game_state = [playerA: _, playerB: _]) do
    next_game_state(player, game_state)
  end

  def score(player, state = Game[for: _]),  do: state

  defp next_game_state(player, [playerA: x, playerB: y])
    when x == 40 and y <= 30 and player == :playerA or
         x <= 30 and y == 40 and player == :playerB do
    Game.new(for: player)
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
