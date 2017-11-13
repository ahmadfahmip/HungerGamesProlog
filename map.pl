/* Fact */


/* Rules */

init_map([], map_game).

position(X, Y, Building) :- X > 0, X < 3, Y > 12, Y < 21, Building = village.