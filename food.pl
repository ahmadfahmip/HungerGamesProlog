:- dynamic(location/3).
/* All food added */

/* Id of food */
food_id(6, nothing).
food_id(1, nasi_korea).
food_id(2, nasi_jepang).
food_id(3, danusan).
food_id(4, geprek).
food_id(5, uncle_bro).

/* Food hunger rate */
food_rate(nasi_korea, 35).
food_rate(nasi_jepang, 40).
food_rate(danusan, 10).
food_rate(geprek, 50).
food_rate(uncle_bro, 20).
food_rate(nothing, 0).

/* Initialize map with items */

init_all_food :-
	init_food(10), init_food_location(5).

init_food(0) :- !.
init_food(N) :- random_food, M is N -1, init_food(M).
	
init_food_location(0) :- !.
init_food_location(N) :- random_food_location, M is N -1, init_food_location(M).

random_food :-
	random(1, 6, N), food_id(N, A), 
	random(1, 11, X), random(1, 21, Y),
	asserta(location(X, Y, A)).

random_food_location :-
	random(1, 6, N), food_id(N, A), 
	random(1, 11, X), random(1, 21, Y),
	asserta(location(X, Y, A)).
