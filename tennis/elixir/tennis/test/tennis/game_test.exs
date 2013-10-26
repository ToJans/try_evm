defmodule Tennis.Game.Specs do
  use Amrita.Sweet
  import Tennis.Game

  fixtures = [
    [GameState.new, :playerA, GameState.new(score: [playerA: 15, playerB: 0])],
    [GameState.new(score: [playerA: 15, playerB: 0]), :playerA, GameState.new(score: [playerA: 30, playerB: 0])]
  ]

  lc [state, player, expected_state] inlist fixtures do
    @player player
    @state  state
    @expected_state expected_state

    test "For current state #{inspect(state)} when player #{player} scores, the new state should be #{inspect(expected_state)}" do
      score(@player, @state) |> equals @expected_state
    end
  end
end
