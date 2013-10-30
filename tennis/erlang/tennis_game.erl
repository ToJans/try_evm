-module(tennis_game).
-export([score/2]).

score(Player, CurrentState) ->
  next_game_state(Player, CurrentState).

next_game_state(_, CurrentState = {game, _}) ->
  CurrentState;

next_game_state(Player, deuce) ->
  {advantage, Player};

next_game_state(Player, {advantage, OtherPlayer}) when Player =/= OtherPlayer ->
  deuce;

next_game_state(Player, {advantage, _}) ->
  {game, Player};

next_game_state(playerA, [{playerA, X}, {playerB, Y}]) when X == 40, Y =< 30 ->
  {game, playerA};

next_game_state(playerB, [{playerA, X}, {playerB, Y}]) when X =< 30, Y == 40 ->
  {game, playerB};

next_game_state(playerA, [{playerA, X}, {playerB, Y}]) when X == 40, Y == 30 ->
  deuce;

next_game_state(playerB, [{playerA, X}, {playerB, Y}]) when X == 30, Y == 40 ->
  deuce;

next_game_state(Player, GameState) ->
  OldScore = list:keyfind(Player, 1, GameState),
  list:keymerge(GameState, 1, GameState, [{Player, new_player_score(OldScore)}]).

new_player_score(score) ->
  case score of 
    0  -> 15;
    15 -> 30;
    30 -> 40
  end.
