/* Hentikan semua kegilaan ini */

start :- 
	g_read(started, X), X = 0, !,
	welcome,
	g_assign(started, 1),
	main_loop.
start :- g_read(started, X), X = 1, write('Game sudah dimulai'), nl.

main_loop :-
	repeat,
	write('Say something > '),
	read(X),
	format('You said: ~w', [X]), nl,
	X = exit, !.

welcome :- 	
	write('Welcome to the 77th Hunger Games!'), nl,
	write('You have been chosen as one of the lucky contestants. '),
	write('Be the last man standing and you will be remembered as one of the victors.'),
	nl.
