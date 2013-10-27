defmodule Tennis.Game.Specs do
  use Amrita.Sweet
  import Tennis.Game

  fixtures = [
    [[playerA: 0, playerB: 0], :playerA, [playerA: 15, playerB: 0]],
    [[playerA: 15, playerB: 0], :playerA, [playerA: 30, playerB: 0]],
    [[playerA: 30, playerB: 0], :playerA, [playerA: 40, playerB: 0]],
    [[playerA: 30, playerB: 0], :playerB, [playerA: 30, playerB: 15]],
    [[playerA: 40, playerB: 0], :playerA, Game[for: :playerA]],
    [[playerA: 0, playerB: 40], :playerB, Game[for: :playerB]],
    [[playerA: 0, playerB: 40], :playerA, [playerA: 15, playerB: 40]],
    [Game[for: :playerB], :playerA, Game[for: :playerB]],
    [Game[for: :playerA], :playerA, Game[for: :playerA]],
    [[playerA: 30, playerB: 40], :playerA, :deuce],
    [[playerA: 40, playerB: 30], :playerB, :deuce],
    [:deuce, :playerB, Advantage[for: :playerB]],
    [Advantage[for: :playerB], :playerA, :deuce],
    [Advantage[for: :playerA], :playerB, :deuce],
    [Advantage[for: :playerA], :playerA, Game[for: :playerA]],
    [Advantage[for: :playerB], :playerB, Game[for: :playerB]],
  ]

  lc [state, player, expected_state] inlist fixtures do
    @player player
    @state  state
    @expected_state expected_state

    test "For state <#{inspect(state)}> when <#{player}> scores, the new state should be <#{inspect(expected_state)}>" do
      score(@player, @state) |> equals @expected_state
    end
  end
end
