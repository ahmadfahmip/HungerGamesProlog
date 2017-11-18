attack :-

help :-
	write('Available commands :'), nl,
	write('start.			-- start the game!'), nl,
	write('help.			-- show available commands'), nl,
	write('quit.			-- quit the game'),nl,
	write('look.			-- look around you'), nl,
	write('n. s. e. w.		-- move'), nl,
	write('map.				-- look at the map and detect enemies (need radar to use)'), nl,
	write('take(Object)		-- pick up an object'), nl,
	write('drop(Object)		-- drop an object'), nl,
	write('use(Object)		-- use an object'), nl,
	write('attack.			-- attack enemy that crosses your path'), nl,
	write('status.			-- show your status'), nl,
	write('save(Filename)	-- save your game'), nl,
	write('load(Filename)	-- load previously saved game'), nl,
	write(''), nl,
	write('Legends :'), nl,
	write('M = Medicine'), nl,
	write('F = Food'), nl,
	write('W = Water'), nl,
	write('# = Weapon'), nl,
	write('P = Player'), nl,
	write('E = Enemy'), nl,
	write('- = Accessible'), nl,
	write('X = Innaccessible'), nl.

quit :- g_assign(started, 0).

look :-

use(Object) :- 

status :-
