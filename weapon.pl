:- dynamic(location/3).
/* All weapon added */

/* Id of weapon */
weapon_id(6, nothing).
weapon_id(1, webtoon).
weapon_id(2, anime).
weapon_id(3, dota).
weapon_id(4, begadang).
weapon_id(5, osjur).

/* Attack of weapon */
weapon_atk(webtoon, 10).
weapon_atk(anime, 20).
weapon_atk(dota, 30).
weapon_atk(begadang, 50).
weapon_atk(osjur, 70).
weapon_atk(nothing, 0).

/* Initialize map with items */

init_all_weapon :-
	init_weapon(10), init_weapon_forge(5).

init_weapon(0) :- !.
init_weapon(N) :- random_weapon, M is N -1, init_weapon(M).
	
init_weapon_forge(0) :- !.
init_weapon_forge(N) :- random_weapon_forge, M is N -1, init_weapon_forge(M).

random_weapon :-
	random(1, 6, N), weapon_id(N, A), 
	random(1, 11, X), random(1, 21, Y),
	asserta(location(X, Y, A)).

random_weapon_forge :-
	random(1, 6, N), weapon_id(N, A), 
	random(7, 10, X), random(17, 20, Y),
	asserta(location(X, Y, A)).
