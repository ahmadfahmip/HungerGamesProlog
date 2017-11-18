:- dynamic(location/3).
/* All drink added */

/* Id of drink */
drink_id(6, nothing).
drink_id(1, aqua).
drink_id(2, go_milk).
drink_id(3, thai_tea).
drink_id(4, chocolate_changer).
drink_id(5, coffee).

/* drink thirst rate */
drink_rate(aqua, 20).
drink_rate(go_milk, 30).
drink_rate(thai_tea, 40).
drink_rate(chocolate_changer, 25).
drink_rate(coffee, 50).
drink_rate(nothing, 0).

/* Initialize map with items */

init_all_drink :-
	init_drink(10), init_drink_location(5).

init_drink(0) :- !.
init_drink(N) :- random_drink, M is N -1, init_drink(M).
	
init_drink_location(0) :- !.
init_drink_location(N) :- random_drink_location, M is N -1, init_drink_location(M).

random_drink :-
	random(1, 6, N), drink_id(N, A), 
	random(1, 11, X), random(1, 21, Y),
	asserta(location(X, Y, A)).

random_drink_location :-
	random(1, 6, N), drink_id(N, A), 
	random(1, 11, X), random(1, 21, Y),
	asserta(location(X, Y, A)).
