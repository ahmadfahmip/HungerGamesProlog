/* Hentikan semua kegilaan ini */

/* This command to start the game */

start :- g_read(started, X), X = 1, write('Game has already started'), nl, fail, !.
start :-
	g_read(started, X), X = 0, !,
	g_assign(started, 1),
	set_seed(50), randomize,
	repeat,
	write('Do you want to load save file or want to start from scratch?? (Press 1 for yes or 0 for no)'), 
	nl, write('> '),
	read(X), check_load(X),
	welcome,
	main_loop.

/* init everything when game started without load */
init_everything :-
	init_every_item,
	init_player.

main_loop :-
	repeat,
	write('Do something > '),
	read(X),
	format('You said: ~w', [X]), nl,
	call(X),
	X = quit, !.

check_load(0) :- init_everything, !.
check_load(1) :- !.


