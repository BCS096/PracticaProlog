pertany(X,[X|_]).
pertany(X,[_|L]):-pertany(X,L).

esborrar(_,[],[]).
esborrar(X,[X|L],L) :- !.
esborrar(X,[Y|L1],[Y|L2]):-esborrar(X,L1,L2).

afegir([],L,L).
afegir([X|L1],L2,[X|L3]):-afegir(L1,L2,L3).

invertir([X],[X]).
invertir([X|L1],L2):-invertir(L1,L3), afegir(L3,[X],L2).
%section 1 (1,5 points)
%----------------------
paraula(X):- member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela,
cuerpo, jugar, juicio, error, vicio, rea]),atom_chars(Y,X).

paraula(X):- member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela,
cuerpo, jugar, juicio, error, vicio, rea]),atom_chars(Y,Z),reverse(Z,X).
%----------------------
%section 2 (1,5 points)
%----------------------
igual([],[]).
igual([X|L1],[X|L2]):- igual(L1,L2).

estadinsllista(X,[Y|_]):- igual(X,Y).
estadinsllista(X,[_|L1]):- estadinsllista(X,L1).


repeticio([X|_],Y) :- esborrar(X,Y,L),estadinsllista(X,L).
repeticio([_|L],Y):- repeticio(L,Y),!.

repetides(X):- repeticio(X,X).
%----------------------
