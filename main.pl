start:-
  init_player,
  repeat,
  read(X),
  call(X).


stats:-
  get_health(Health),
  write('Health :'),
  write(Health),nl,
  write('Hunger :'),
  get_hunger(Hunger),
  write(Hunger),nl.
