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
%----------------------
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
mostra([H|Q],F,C,horitzontal):-gotoXY(C,F),escriu(H,blau),F1 is F+4,mostra(Q,F1,C,horitzontal),!.
mostra([H|Q],F,C,vertical):-gotoXY(C,F),escriu(H,vermell),C1 is C+2,mostra(Q,F,C1,vertical),!.
%----------------------
%Section 4 (4 points)
%----------------------
car([H|_],H).
mida([],0).
mida([_|Q],N):-mida(Q,N1),N is N1 + 1.
trobaPrimera(N):-paraula(L),afegir(car(L),[],P),mida(P,M),N=M,!.
creuats:-paraula(P1),mida(P1,7),
    paraula(P2),mida(P2,11),
    \+ igual(P1,P2),
    nth1(5,P1,X),nth1(1,P2,X),
    paraula(P3),mida(P3,5),
    \+ igual(P2,P3),
    nth1(3,P2,X1),nth1(3,P3,X1),
    paraula(P4),mida(P4,7),
    \+ igual(P3,P4),
    nth1(11,P2,X2),nth1(5,P4,X2),
    paraula(P5),mida(P5,3),
    \+ igual(P4,P5),
    nth1(7,P4,X3),nth1(3,P5,X3),
    paraula(P6),mida(P6,8),
    \+ igual(P5,P6),
    nth1(3,P4,X4),nth1(6,P6,X4),
    paraula(P7),mida(P7,10),
    \+ igual(P6,P7),
    nth1(8,P6,X5),nth1(6,P7,X5),
    paraula(P8),mida(P8,8),
    \+ igual(P7,P8),
    nth1(1,P6,X6),nth1(8,P8,X6),
    paraula(P9),mida(P9,6),
    \+ igual(P8,P9),
    nth1(6,P8,X7),nth1(4,P9,X7),
    paraula(P10),mida(P10,8),
    \+ igual(P9,P10),
    nth1(4,P8,X8),nth1(5,P10,X8),
    paraula(P11),mida(P11,6),
    \+ igual(P10,P11),
    nth1(3,P10,X9),nth1(6,P11,X9),
    paraula(P12),mida(P12,5),
    \+ igual(P11,P12),
    nth1(1,P11,X10),nth1(1,P12,X10),
    paraula(P13),mida(P13,8),
    \+ igual(P12,P13),
    nth1(1,P8,X11),nth1(1,P13,X11),
    paraula(P14),mida(P14,5),
    \+ igual(P13,P14),
    nth1(6,P13,X12),nth1(2,P14,X12),
    cls,
    mostra(P1,28,0,horitzontal),nl,
    mostra(P2,44,0,vertical),nl,
    mostra(P3,36,4,horitzontal),nl,
    mostra(P4,28,20,horitzontal),nl,
    mostra(P5,52,16,vertical),nl,
    mostra(P6,36,10,vertical),nl,
    mostra(P7,16,24,horitzontal),nl,
    mostra(P8,8,10,vertical),nl,
    mostra(P9,28,4,vertical),nl,
    mostra(P10,20,2,vertical),nl,
    mostra(P11,0,6,horitzontal),nl,
    mostra(P12,0,6,vertical),nl,
    mostra(P13,8,10,vertical),nl,
    mostra(P14,4,20,horitzontal),nl,
    gotoXY(30,0).%Aix� no molesta el "true"
