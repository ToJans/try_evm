defmodule Tennis.Game.Specs do
  use Amrita.Sweet
  import Tennis.Game

  fixtures = [
    [[playerA: 0, playerB: 0], :playerA, [playerA: 15, playerB: 0]],
    [[playerA: 15, playerB: 0], :playerA, [playerA: 30, playerB: 0]],
    [[playerA: 30, playerB: 0], :playerA, [playerA: 40, playerB: 0]],
    [[playerA: 30, playerB: 0], :playerB, [playerA: 30, playerB: 15]],
    [[playerA: 40, playerB: 0], :playerA, GameState.Won[by: :playerA]],
    [[playerA: 0, playerB: 40], :playerB, GameState.Won[by: :playerB]],
    [GameState.Won[by: :playerB], :playerA, GameState.Won[by: :playerB]],
    [GameState.Won[by: :playerA], :playerA, GameState.Won[by: :playerA]]
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
