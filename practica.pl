%----------------------
%Includes
%----------------------
:-consult(auxiliar).
%----------------------
%Preamble
%----------------------

pertany(X,[X|_]).
pertany(X,[_|L]):-pertany(X,L).

esborrar(_,[],[]):- !.
esborrar(X,[X|L],L):- !.
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


repeticio([X|_],Y) :- esborrar(X,Y,L),estadinsllista(X,L),!.
repeticio([_|L],Y):- repeticio(L,Y).

repetides(X):- repeticio(X,X).
%----------------------
%Section 3 (1 points)
%----------------------
salta(0).
salta(N):-nl,N1 is N-1,salta(N1).
escriuBlanc(0).
escriuBlanc(N):-N1 is N-1,write(' '),escriuBlanc(N1).
mostra([],_,_,_) :- !.
mostra([H|Q],F,C,horitzontal):-gotoXY(C,F),escriu(H,blau),F1 is F+2,mostra(Q,F1,C,horitzontal),!.
mostra([H|Q],F,C,vertical):-gotoXY(C,F),escriu(H,vermell),C1 is C+2,mostra(Q,F,C1,vertical),!.
%----------------------
%Section 4 (4 points)
%----------------------
matriu(M):-afegir([[7,0,13,0,11,0],[11,0,11,12,11,2,11,12],[3,9,3,13],[]],[],M).
car([H|_],H).
mida([],0).
mida([_|Q],N):-mida(Q,N1),N is N1 + 1.
trobaPrimera(N):-paraula(L),afegir(car(L),[],P),mida(P,M),N=M,!.
creuats:-nl.
creuats :- paraula(_).
puta(X):- mostra(X,20,5,vertical),mostra(X,20,5,horitzontal).
