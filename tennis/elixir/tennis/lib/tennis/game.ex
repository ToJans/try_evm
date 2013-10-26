defrecord GameState, id: :regular, score: [playerA: 0, playerB: 0]

defmodule Tennis.Game do
  def score(player, game_state = GameState[id: :regular]) when player in [:playerA, :playerB] do
    old_score = Keyword.get(game_state.score, player)
    new_score = Keyword.put(game_state.score, player, old_score + 15)
    GameState.new(score: new_score)
  end
end
