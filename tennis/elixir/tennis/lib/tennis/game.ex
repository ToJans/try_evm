defrecord Game, for: nil
defrecord Advantage, for: nil

defmodule Tennis.Game do

  def score(player, game_state), do: next_game_state(player, game_state)

  defp next_game_state(_, state = Game[for: _]),  do: state

  defp next_game_state(player, :deuce),  do: Advantage.new(for: player)

  defp next_game_state(player, Advantage[for: other_player]) when player != other_player, do: :deuce

  defp next_game_state(player, Advantage[for: _]), do: Game.new(for: player)

  defp next_game_state(player, [playerA: x, playerB: y])
    when x == 40 and y <= 30 and player == :playerA or
         x <= 30 and y == 40 and player == :playerB do
    Game.new(for: player)
  end

  defp next_game_state(player, [playerA: x, playerB: y])
    when x == 40 and y == 30 and player == :playerB or
         x == 30 and y == 40 and player == :playerA do
    :deuce
  end

  defp next_game_state(player, game_state = [playerA: _, playerB: _]) do
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
