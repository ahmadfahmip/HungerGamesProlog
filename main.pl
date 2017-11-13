/* Hentikan semua kegilaan ini */

init :- g_assign(started, 0).
start :- 
	g_read(started, X), X = 0, 
	welcome,
	g_assign(started, 1).
start :- g_read(started, X), X = 1, write('Game sudah dimulai'), nl.

welcome :- 	
	write('Welcome to the 77th Hunger Games!'), nl,
	write('You have been chosen as one of the lucky contestants. '),
	write('Be the last man standing and you will be remembered as one of the victors.'),
	nl.

help :-
	write('Available commands:'), nl,
	
