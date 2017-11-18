/* Hentikan semua kegilaan ini */

/* This command to start the game */

start :- g_read(started, X), X = 1, write('Game has already started'), nl, fail, !.
start :-
	g_read(started, X), X = 0, !,
	welcome,
	g_assign(started, 1),
	set_seed(50), randomize,
	init_everything,
	main_loop.

/* init everythin when game started without load */
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

