defmodule Tennis.Game.Specs do
  use Amrita.Sweet
  import Tennis.Game

  fixtures = [
    [[playerA: 0, playerB: 0], :playerA, [playerA: 15, playerB: 0]],
    [[playerA: 15, playerB: 0], :playerA, [playerA: 30, playerB: 0]],
    [[playerA: 30, playerB: 0], :playerA, [playerA: 40, playerB: 0]],
    [[playerA: 30, playerB: 0], :playerB, [playerA: 30, playerB: 15]],
    [[playerA: 40, playerB: 0], :playerA, [game: :playerA]],
    [[playerA: 0, playerB: 40], :playerB, [game: :playerB]],
    [[playerA: 0, playerB: 40], :playerA, [playerA: 15, playerB: 40]],
    [[game: :playerB], :playerA, [game: :playerB]],
    [[game: :playerA], :playerA, [game: :playerA]],
    [[playerA: 30, playerB: 40], :playerA, :deuce],
    [[playerA: 40, playerB: 30], :playerB, :deuce],
    [:deuce, :playerB, [advantage: :playerB]],
    [[advantage: :playerB], :playerA, :deuce],
    [[advantage: :playerA], :playerB, :deuce],
    [[advantage: :playerA], :playerA, [game: :playerA]],
    [[advantage: :playerB], :playerB, [game: :playerB]],
  ]

  lc [state, player, expected_state] inlist fixtures do
    @player player
    @state  state
    @expected_state expected_state

    facts "For state <#{inspect(state)}>" do
      fact "when <#{player}> scores, the new state should be <#{inspect(expected_state)}>" do
        score(@player, @state) |> equals @expected_state
      end
    end
  end
end
