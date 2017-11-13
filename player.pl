:- dynamic(player/5).

default_health(100).
default_hunger(20).
default_thirst(50).
default_weapon('nothing').
default_item_list([]).

init_player:-
  default_health(Health),
  default_hunger(Hunger),
  default_thirst(Thirst),
  default_weapon(Weapon),
  default_item_list(ItemList),
  % FYI, assert buat masukin ke database
  asserta(player(Health,Hunger,Thirst,Weapon,ItemList)).

% Health
increase_health( Amount):-
  retract(player(Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHealth is Health+Amount,
  asserta(player(ResultHealth,Hunger,Thirst,Weapon,ItemList)).

decrease_health(Amount):-
  retract(player(Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHealth is Health-Amount,
  asserta(player(ResultHealth,Hunger,Thirst,Weapon,ItemList)).

get_health(Health):-
  player(Health,_,_,_,_).

set_health(Health):-
  retract(player(CurrentHealth,Hunger,Thirst,Weapon,ItemList)),
  asserta(player(Health,Hunger,Thirst,Weapon,ItemList)).

% Hunger
increase_hunger( Amount):-
  retract(player(Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHunger is Hunger+Amount,
  asserta(player(Health,ResultHunger,Thirst,Weapon,ItemList)).

decrease_hunger(Amount):-
  retract(player(Health,Hunger,Thirst,Weapon,ItemList)),
  ResultHunger is Hunger-Amount,
  asserta(player(Health,ResultHunger,Thirst,Weapon,ItemList)).

get_hunger(Hunger):-
  player(_,Hunger,_,_,_).

set_hunger(Hunger):-
  retract(player(Health,CurrentHunger,Thirst,Weapon,ItemList)),
  asserta(player(Health,Hunger,Thirst,Weapon,ItemList)).

% Thirst
increase_thirst(Amount):-
  retract(player(Health,Hunger,Thirst,Weapon,ItemList)),
  ResultThirst is Thirst+Amount,
  asserta(player(Health,Hunger,ResultThirst,Weapon,ItemList)).

decrease_thirst(Amount):-
  retract(player(Health,Hunger,Thirst,Weapon,ItemList)),
  ResultThirst is Thirst-Amount,
  asserta(player(Health,Hunger,ResultThirst,Weapon,ItemList)).

get_thirst(Thirst):-
  player(_,_,Thirst,_,_).

set_thirst(Thirst):-
  retract(player(Health,Hunger,CurrentThirst,Weapon,ItemList)),
  asserta(player(Health,Hunger,Thirst,Weapon,ItemList)).

% Weapon
set_weapon(Weapon):-
  retract(player(Health,Hunger,Thirst,CurrentWeapon,ItemList)),
  asserta(player(Health,Hunger,Thirst,Weapon,ItemList)).

get_weapon(Weapon):-
  player(_,_,_,Weapon,_).

% Item List
add_item(Item):-
  retract(player(Health,Hunger,Thirst,Weapon,ItemList)),
  append([Item],ItemList,NewItemList),
  asserta(player(Health,Hunger,Thirst,Weapon,NewItemList)).

get_item_list(ItemList):-
  player(_,_,_,_,ItemList).
