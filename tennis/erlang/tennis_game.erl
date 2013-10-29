- module(tennis_game).
- export([score/2]).

score(Player, CurrentState) -> 
  next_game_state(Player, CurrentState).

next_game_state(_, CurrentState = {game, _}) ->
  CurrentState;

next_game_state(Player, deuce) ->
  {advantage, Player};

next_game_state(Player, {advantage, OtherPlayer}) when Player =/= OtherPlayer ->
  deuce;

next_game_state(Player, {advantage, _}) ->
  {game, Player}.

%next_game_state(Player, [{playerA, X}, {playerB, Y}]) 
  %when X == 40 and Y <= 30 and Player == playerA or
       %X <= 30 and Y == 40 and Player == playerB ->
  %{game, Player}.

%defp next_game_state(player, [playerA: x, playerB: y])
  %when x == 40 and y <= 30 and player == :playerA or
       %x <= 30 and y == 40 and player == :playerB do
  %Game.new(for: player)
  %defp next_game_state(player, [playerA: x, playerB: y])
    %when x == 40 and y == 30 and player == :playerB or
         %x == 30 and y == 40 and player == :playerA do
    %:deuce
  %end

  %defp next_game_state(player, game_state = [playerA: _, playerB: _]) do
    %old_score = Keyword.get(game_state, player)
    %Keyword.put(game_state, player, new_player_score(old_score)) |> Enum.sort
  %end

  %defp new_player_score(score) do
    %case score do
      %0  -> 15
      %15 -> 30
      %30 -> 40
    %end
  %end
%end
