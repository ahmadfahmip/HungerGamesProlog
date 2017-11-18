:- dynamic(player/7).

default_health(100).
default_hunger(20).
default_thirst(50).
default_weapon(nothing).
default_weapon(nothing).
default_item_list([]).

random_location(X, Y) :-
  repeat,
  random(1, 11, A), random(1, 21, B),
  grid(A, B, Loc), 
  Loc \== blank,
  X is A, Y is B.

init_player:-
  default_health(Health),
  default_hunger(Hunger),
  default_thirst(Thirst),
  default_weapon(Weapon),
  default_item_list(ItemList),
  random_location(X,Y),
  % FYI, assert buat masukin ke database
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)), !.

% Health
increase_health( Amount):-
  retract(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHealth is Health+Amount,
  asserta(player(X,Y,ResultHealth,Hunger,Thirst,Weapon,ItemList)).

decrease_health(Amount):-
  retract(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHealth is Health-Amount,
  asserta(player(X,Y,ResultHealth,Hunger,Thirst,Weapon,ItemList)).

get_health(Health):-
  player(_,_,Health,_,_,_,_).

set_health(Health):-
  retract(player(X,Y,CurrentHealth,Hunger,Thirst,Weapon,ItemList)),
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)).

% Hunger
increase_hunger( Amount):-
  retract(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHunger is Hunger+Amount,
  asserta(player(X,Y,Health,ResultHunger,Thirst,Weapon,ItemList)).

decrease_hunger(Amount):-
  retract(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHunger is Hunger-Amount,
  asserta(player(X,Y,Health,ResultHunger,Thirst,Weapon,ItemList)).

get_hunger(Hunger):-
  player(_,_,_,Hunger,_,_,_).

set_hunger(Hunger):-
  retract(player(X,Y,Health,CurrentHunger,Thirst,Weapon,ItemList)),
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)).

% Thirst
increase_thirst(Amount):-
  retract(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultThirst is Thirst+Amount,
  asserta(player(X,Y,Health,Hunger,ResultThirst,Weapon,ItemList)).

decrease_thirst(Amount):-
  retract(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultThirst is Thirst-Amount,
  asserta(player(X,Y,Health,Hunger,ResultThirst,Weapon,ItemList)).

get_thirst(Thirst):-
  player(_,_,_,_,Thirst,_,_).

set_thirst(Thirst):-
  retract(player(X,Y,Health,Hunger,CurrentThirst,Weapon,ItemList)),
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)).

% Weapon
set_weapon(Weapon):-
  retract(player(X,Y,Health,Hunger,Thirst,CurrentWeapon,ItemList)),
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)).

get_weapon(Weapon):-
  player(_,_,_,_,_,Weapon,_).

% Item List
add_item(Item):-
  retract(player(X,Y,Health,Hunger,Thirst,Weapon,ItemList)),
  append([Item],ItemList,NewItemList),
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,NewItemList)).

get_item_list(ItemList):-
  player(_,_,_,_,_,_,ItemList).

% Position
get_position(X,Y):-
  player(X,Y,_,_,_,_,_).

set_position(X,Y):-
  retract(player(CurrentX,CurrentY,Health,Hunger,Thirst,Weapon,ItemList)),
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,NewItemList)).

step_up:-
  player(X,CurrentY,Health,Hunger,Thirst,Weapon,ItemList),
  CurrentY > 0,
  retract(player(X,CurrentY,Health,Hunger,Thirst,Weapon,ItemList)),
  Y is CurrentY-1,
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,NewItemList)).

step_down:-
  player(X,CurrentY,Health,Hunger,Thirst,Weapon,ItemList),
  CurrentY < 20,
  retract(player(X,CurrentY,Health,Hunger,Thirst,Weapon,ItemList)),
  Y is CurrentY+1,
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,NewItemList)).

step_left:-
  player(CurrentX,Y,Health,Hunger,Thirst,Weapon,ItemList),
  CurrentX > 0,
  retract(player(CurrentX,Y,Health,Hunger,Thirst,Weapon,ItemList)),
  X is CurrentX-1,
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,NewItemList)).

step_right:-
  player(CurrentX,Y,Health,Hunger,Thirst,Weapon,ItemList),
  CurrentX < 10,
  retract(player(CurrentX,Y,Health,Hunger,Thirst,Weapon,ItemList)),
  X is CurrentX+1,
  asserta(player(X,Y,Health,Hunger,Thirst,Weapon,NewItemList)).
