-module(tennis_game).
-export([score/2]).

score(Player, CurrentState) ->
  next_game_state(Player, CurrentState).

next_game_state(_, CurrentState = {game, _}) ->
  CurrentState;
next_game_state(Player, deuce) ->
  {advantage, Player};
next_game_state(Player, {advantage, Player}) ->
  {game, Player};
next_game_state(Player, {advantage, _OtherPlayer}) ->
  deuce;
next_game_state(playerA, [{playerA, 30}, {playerB, 40}]) ->
  deuce;
next_game_state(playerB, [{playerA, 40}, {playerB, 30}]) ->
  deuce;
next_game_state(playerA, [{playerA, 40}, {playerB, _ }]) ->
  {game, playerA};
next_game_state(playerB, [{playerA, _ }, {playerB, 40}]) ->
  {game, playerB};
next_game_state(Player, GameState) ->
  {_, OldScore} = lists:keyfind(Player, 1, GameState),
  lists:keyreplace(Player, 1, GameState, {Player, new_player_score(OldScore)}).

new_player_score(0) ->
  15;
new_player_score(15) ->
  30;
new_player_score(30) ->
  40.
