:- dynamic(enemy/4).
/* Enemy(EnemyID, EnemyX, EnemyY, EnemyHealth) */
:- dynamic(location/3).


init_enemy(EnemyID, X, Y, Health):-
  asserta(enemy(EnemyID, X, Y, Health)).

init_enemy_location(0) :- !.
init_enemy_location(N) :- random_enemy_location(N), M is N-1, init_enemy_location(M).

random_enemy_location(EnemyID) :-
  random(1, 11, X), random(1, 21, Y), random(20, 45, Health),
  init_enemy(EnemyID, X, Y, Health), asserta(location(X, Y, EnemyID)).

% Health
decrease_health(Amount):-
  retract(enemy(EnemyID, X, Y, Health)),
  ResultHealth is Health-Amount,
  asserta(enemy(EnemyID, X, Y, ResultHealth)).

get_health(Health):-
  enemy(_,_,_,Health).

set_health(Health):-
  retract(enemy(EnemyID, X, Y, CurrentHealth)),
  asserta(enemy(EnemyID, X, Y, Health)).

% Position
get_position(X,Y):-
  enemy(_,X,Y,_).

set_position(X,Y):-
  retract(enemy(EnemyID, CurrentX, CurrentY, Health)),
  asserta(enemy(EnemyID, X, Y, Health)).

step_up:-
  enemy(EnemyID, X, CurrentY, Health),
  CurrentY > 0,
  retract(enemy(EnemyID, X, CurrentY, Health)),
  Y is CurrentY-1,
  asserta(enemy(EnemyID, X, Y, Health)).

step_down:-
  enemy(EnemyID, X, CurrentY, Health),
  CurrentY < 20,
  retract(enemy(EnemyID, X, CurrentY, Health)),
  Y is CurrentY+1,
  asserta(enemy(EnemyID, X, Y, Health)).

step_left:-
  enemy(EnemyID, X, CurrentY, Health),
  CurrentX > 0,
  retract(enemy(EnemyID, CurrentX, Y, Health)),
  X is CurrentX-1,
  asserta(enemy(EnemyID, X, Y, Health)).

step_right:-
  enemy(EnemyID, CurrentX, Y, Health),
  CurrentX < 10,
  retract(enemy(EnemyID, CurrentX, Y, Health)),
  X is CurrentX+1,
  asserta(enemy(EnemyID, X, Y, Health)).
