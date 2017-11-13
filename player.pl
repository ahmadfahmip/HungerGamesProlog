:- dynamic(player/6).

default_health(100).
default_hunger(20).
default_thirst(50).
default_weapon('nothing').
default_item_list([]).

init_player(ID):-
  default_health(Health),
  default_hunger(Hunger),
  default_thirst(Thirst),
  default_weapon(Weapon),
  default_item_list(ItemList),
  % FYI, assert buat masukin ke database
  asserta(player(ID,Health,Hunger,Thirst,Weapon,ItemList)).

% Health
increase_health(ID, Amount):-
  retract(player(ID,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHealth is Health+Amount,
  asserta(player(ID,ResultHealth,Hunger,Thirst,Weapon,ItemList)).

decrease_health(ID,Amount):-
  retract(player(ID,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHealth is Health-Amount,
  asserta(player(ID,ResultHealth,Hunger,Thirst,Weapon,ItemList)).

get_health(ID,Health):-
  player(ID,Health,_,_,_,_).

set_health(ID,Health):-
  retract(player(ID,CurrentHealth,Hunger,Thirst,Weapon,ItemList)),
  asserta(player(ID,Health,Hunger,Thirst,Weapon,ItemList)).

% Hunger
increase_hunger(ID, Amount):-
  retract(player(ID,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHunger is Hunger+Amount,
  asserta(player(ID,Health,ResultHunger,Thirst,Weapon,ItemList)).

decrease_hunger(ID,Amount):-
  retract(player(ID,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHunger is Hunger-Amount,
  asserta(player(ID,Health,ResultHunger,Thirst,Weapon,ItemList)).

get_hunger(ID,Hunger):-
  player(ID,_,Hunger,_,_,_).

set_hunger(ID,Hunger):-
  retract(player(ID,Health,CurrentHunger,Thirst,Weapon,ItemList)),
  asserta(player(ID,Health,Hunger,Thirst,Weapon,ItemList)).

% Thirst
increase_thirst(ID,Amount):-
  retract(player(ID,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultThirst is Thirst+Amount,
  asserta(player(ID,Health,Hunger,ResultThirst,Weapon,ItemList)).

decrease_thirst(ID,Amount):-
  retract(player(ID,Health,Hunger,Thirst,Weapon,ItemList)),
  ResultThirst is Thirst-Amount,
  asserta(player(ID,Health,Hunger,ResultThirst,Weapon,ItemList)).

get_thirst(ID,Thirst):-
  player(ID,_,_,Thirst,_,_).

set_thirst(ID,Thirst):-
  retract(player(ID,Health,Hunger,CurrentThirst,Weapon,ItemList)),
  asserta(player(ID,Health,Hunger,Thirst,Weapon,ItemList)).

% Weapon
set_weapon(ID,Weapon):-
  retract(player(ID,Health,Hunger,Thirst,CurrentWeapon,ItemList)),
  asserta(player(ID,Health,Hunger,Thirst,Weapon,ItemList)).

get_weapon(ID,Weapon):-
  player(ID,_,_,_,Weapon,_).

% Item List
add_item(ID,Item):-
  retract(player(ID,Health,Hunger,Thirst,Weapon,ItemList)),
  append([Item],ItemList,NewItemList),
  asserta(player(ID,Health,Hunger,Thirst,Weapon,NewItemList)).

get_item_list(ID,ItemList):-
  player(ID,_,_,_,_,ItemList).
