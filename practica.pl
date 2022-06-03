%----------------------
%Includes
%----------------------
:-consult(auxiliar).
:-consult(diccionari).
%----------------------
%Preamble
%----------------------

%verificar si un element pertany a una llista
pertany(X,[X|_]).
pertany(X,[_|L]):-pertany(X,L).

%esborrar l'element d'una llista
esborrar(_,[],[]):- !.
esborrar(X,[X|L],L):- !.
esborrar(X,[Y|L1],[Y|L2]):-esborrar(X,L1,L2).

%afegir un element al final d'una llista
afegir([],L,L).
afegir([X|L1],L2,[X|L3]):-afegir(L1,L2,L3).

%invertir una llista
invertir([X],[X]).
invertir([X|L1],L2):-invertir(L1,L3), afegir(L3,[X],L2).

%----------------------
%section 1 (1,5 points)
%----------------------
%llista de paraules al endret o al revés
paraula(X):- member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela,
cuerpo, jugar, juicio, error, vicio, rea]),atom_chars(Y,X).

paraula(X):- member(Y,[democracia, encontrarse, emboscar, abordaje, convexo, evadirse, elevarse, escuela,
cuerpo, jugar, juicio, error, vicio, rea]),atom_chars(Y,Z),reverse(Z,X).

%----------------------
%section 2 (1,5 points)
%----------------------

%comprovar que dues llistes siguin iguals
igual([],[]).
igual([X|L1],[X|L2]):- igual(L1,L2).
%comprovar si un element esta dins la llista
estadinsllista(X,[Y|_]):- igual(X,Y).
estadinsllista(X,[_|L1]):- estadinsllista(X,L1).

%buscam paraules repetides
repeticio([X|_],Y) :- esborrar(X,Y,L),estadinsllista(X,L),!.
repeticio([_|L],Y):- repeticio(L,Y).

repetides(X):- repeticio(X,X).

%----------------------
%Section 3 (1 points)
%----------------------

%mostra(X,Fila,Columna,Orientacio), pimtam cada element H en la posicio indicada FxC, 
%blau i esapis de 4 per horitzontal, vermell i esapis de 2 per vertical 
mostra([],_,_,_) :- !.
mostra([H|Q],F,C,horitzontal):-gotoXY(C,F),escriu(H,blau),F1 is F+4,mostra(Q,F1,C,horitzontal),!.
mostra([H|Q],F,C,vertical):-gotoXY(C,F),escriu(H,vermell),C1 is C+2,mostra(Q,F,C1,vertical),!.

%----------------------
%Section 4 (4 points)
%----------------------
mida([],0).
mida([_|Q],N):-mida(Q,N1),N is N1 + 1.

%Per a una paraula amb una mida N qualsevol,  comprovarem les paraules següents amb aquesta mateixa mida N
%amb totes aquelles anteriors a ella, i les seves inverses, per assegurar la no repetició, i així amb totes les mides que tenim
creuats:-
    paraula(P1),mida(P1,7),
    paraula(P2),mida(P2,11),
    \+ igual(P1,P2),invertir(P2,P2I),\+ igual(P1,P2I),
    nth1(5,P1,X),nth1(1,P2,X),
    paraula(P3),mida(P3,5),
    \+ igual(P2,P3),invertir(P3,P3I),\+ igual(P2,P3I),
    nth1(3,P2,X1),nth1(3,P3,X1),
    paraula(P4),mida(P4,7),
    \+ igual(P3,P4),invertir(P4,P4I),\+ igual(P3,P4I),
    \+ igual(P1,P4),\+ igual(P1,P4I),
    nth1(11,P2,X2),nth1(5,P4,X2),
    paraula(P5),mida(P5,3),
    \+ igual(P4,P5),invertir(P5,P5I),\+ igual(P4,P5I),
    nth1(7,P4,X3),nth1(3,P5,X3),
    paraula(P6),mida(P6,8),
    \+ igual(P5,P6),invertir(P6,P6I),\+ igual(P5,P6I),
    nth1(3,P4,X4),nth1(6,P6,X4),
    paraula(P7),mida(P7,10),
    \+ igual(P6,P7),invertir(P7,P7I),\+ igual(P6,P7I),
    nth1(8,P6,X5),nth1(6,P7,X5),
    paraula(P8),mida(P8,8),
    \+ igual(P7,P8),invertir(P8,P8I),\+ igual(P7,P8I),
    \+ igual(P6,P8),\+ igual(P6,P8I),
    nth1(1,P6,X6),nth1(8,P8,X6),
    paraula(P9),mida(P9,6),
    \+ igual(P8,P9),invertir(P9,P9I),\+ igual(P8,P9I),
    nth1(6,P8,X7),nth1(4,P9,X7),
    paraula(P10),mida(P10,8),
    \+ igual(P9,P10),invertir(P10,P10I),\+ igual(P9,P10I),
    \+ igual(P6,P10),\+ igual(P6,P10I),
    \+ igual(P8,P10),\+ igual(P8,P10I),
    nth1(4,P8,X8),nth1(5,P10,X8),
    paraula(P11),mida(P11,6),
    \+ igual(P10,P11),invertir(P11,P11I),\+ igual(P10,P11I),
    \+ igual(P9,P11),\+ igual(P9,P11I),
    nth1(3,P10,X9),nth1(6,P11,X9),
    paraula(P12),mida(P12,5),
    \+ igual(P11,P12),invertir(P12,P12I),\+ igual(P11,P12I),
    \+ igual(P3,P12),\+ igual(P3,P12I),
    nth1(1,P11,X10),nth1(1,P12,X10),
    paraula(P13),mida(P13,8),
    \+ igual(P12,P13),invertir(P13,P13I),\+ igual(P12,P13I),
    \+ igual(P6,P13),\+ igual(P6,P13I),
    \+ igual(P8,P13),\+ igual(P8,P13I),
    \+ igual(P10,P13),\+ igual(P10,P13I),
    nth1(1,P8,X11),nth1(1,P13,X11),
    paraula(P14),mida(P14,5),
    \+ igual(P13,P14),invertir(P14,P14I),\+ igual(P13,P14I),
    \+ igual(P3,P14),\+ igual(P3,P14I),
    \+ igual(P12,P14),\+ igual(P12,P14I),
    nth1(6,P13,X12),nth1(2,P14,X12),
    cls,
    mostra(P1,28,0,horitzontal),nl,
    mostra(P2,44,0,vertical),nl,
    mostra(P3,36,4,horitzontal),nl,
    mostra(P4,28,20,horitzontal),nl,
    mostra(P5,52,16,vertical),nl,
    mostra(P6,36,10,vertical),nl,
    mostra(P7,16,24,horitzontal),nl,
    mostra(P8,8,10,horitzontal),nl,
    mostra(P9,28,4,vertical),nl,
    mostra(P10,20,2,vertical),nl,
    mostra(P11,0,6,horitzontal),nl,
    mostra(P12,0,6,vertical),nl,
    mostra(P13,8,10,vertical),nl,
    mostra(P14,4,20,horitzontal),nl,
    gotoXY(30,0).%Aixï¿½ no molesta el "true"
    
%----------------------
%Section 5 (2 points)
%----------------------
%carregam paraules
paraula3(X):-
    paraula(_,_,P,nom,comu,_,_,_,_,_,_,_,_,_,_),atom_chars(P,X).
paraula3(X):-
    paraula(_,_,P,adjectiu,_,_,_,_,_,_,_,_,_,_,_),atom_chars(P,X).
paraula3(X):-
    paraula(_,_,P,verb,_,_,_,_,_,_,_,_,_,_,_),atom_chars(P,X).
paraula3(X):-
    paraula(_,_,P,nom,comu,_,_,_,_,_,_,_,_,_,_),atom_chars(P,X),reverse(P,X).
paraula3(X):-
    paraula(_,_,P,adjectiu,_,_,_,_,_,_,_,_,_,_,_),atom_chars(P,X),reverse(P,X).
paraula3(X):-
    paraula(_,_,P,verb,_,_,_,_,_,_,_,_,_,_,_),atom_chars(P,X),reverse(P,X).
%Per a una de les noves paraula amb una mida N qualsevol,  comprovarem les paraules següents amb aquesta mateixa mida N
%amb totes aquelles anteriors a ella, i les seves inverses, per assegurar la no repetició, i així amb totes les mides que tenim
creuats2:-
    paraula3(P1),mida(P1,7),

    paraula3(P2),mida(P2,11),
    \+ igual(P1,P2),invertir(P2,P2I),\+ igual(P1,P2I),
    nth1(5,P1,X),nth1(1,P2,X),

    paraula3(P3),mida(P3,5),
    \+ igual(P2,P3),invertir(P3,P3I),\+ igual(P2,P3I),
    nth1(3,P2,X1),nth1(3,P3,X1),

    paraula3(P4),mida(P4,7),
    \+ igual(P3,P4),invertir(P4,P4I),\+ igual(P3,P4I),
    \+ igual(P1,P4),\+ igual(P1,P4I),
    nth1(11,P2,X2),nth1(5,P4,X2),

    paraula3(P5),mida(P5,3),
    \+ igual(P4,P5),invertir(P5,P5I),\+ igual(P4,P5I),
    nth1(7,P4,X3),nth1(3,P5,X3),

    paraula3(P6),mida(P6,8),
    \+ igual(P5,P6),invertir(P6,P6I),\+ igual(P5,P6I),
    nth1(3,P4,X4),nth1(6,P6,X4),

    paraula3(P7),mida(P7,10),
    \+ igual(P6,P7),invertir(P7,P7I),\+ igual(P6,P7I),
    nth1(8,P6,X5),nth1(6,P7,X5),

    paraula3(P8),mida(P8,8),
    \+ igual(P7,P8),invertir(P8,P8I),\+ igual(P7,P8I),
    \+ igual(P6,P8),\+ igual(P6,P8I),
    nth1(1,P6,X6),nth1(8,P8,X6),

    paraula3(P9),mida(P9,6),
    \+ igual(P8,P9),invertir(P9,P9I),\+ igual(P8,P9I),
    nth1(6,P8,X7),nth1(4,P9,X7),

    paraula3(P10),mida(P10,8),
    \+ igual(P9,P10),invertir(P10,P10I),\+ igual(P9,P10I),
    \+ igual(P6,P10),\+ igual(P6,P10I),
    \+ igual(P8,P10),\+ igual(P8,P10I),
    nth1(4,P8,X8),nth1(5,P10,X8),

    paraula3(P11),mida(P11,6),
    \+ igual(P10,P11),invertir(P11,P11I),\+ igual(P10,P11I),
    \+ igual(P9,P11),\+ igual(P9,P11I),
    nth1(3,P10,X9),nth1(6,P11,X9),

    paraula3(P12),mida(P12,5),
    \+ igual(P11,P12),invertir(P12,P12I),\+ igual(P11,P12I),
    \+ igual(P3,P12),\+ igual(P3,P12I),
    nth1(1,P11,X10),nth1(1,P12,X10),

    paraula3(P13),mida(P13,8),
    \+ igual(P12,P13),invertir(P13,P13I),\+ igual(P12,P13I),
    \+ igual(P6,P13),\+ igual(P6,P13I),
    \+ igual(P8,P13),\+ igual(P8,P13I),
    \+ igual(P10,P13),\+ igual(P10,P13I),
    nth1(1,P8,X11),nth1(1,P13,X11),

    paraula3(P14),mida(P14,5),
    \+ igual(P13,P14),invertir(P14,P14I),\+ igual(P13,P14I),
    \+ igual(P3,P14),\+ igual(P3,P14I),
    \+ igual(P12,P14),\+ igual(P12,P14I),
    nth1(6,P13,X12),nth1(2,P14,X12),


    cls,
    mostra(P1,28,0,horitzontal),nl,
    mostra(P2,44,0,vertical),nl,
    mostra(P3,36,4,horitzontal),nl,
    mostra(P4,28,20,horitzontal),nl,
    mostra(P5,52,16,vertical),nl,
    mostra(P6,36,10,vertical),nl,
    mostra(P7,16,24,horitzontal),nl,
    mostra(P8,8,10,horitzontal),nl,
    mostra(P9,28,4,vertical),nl,
    mostra(P10,20,2,vertical),nl,
    mostra(P11,0,6,horitzontal),nl,
    mostra(P12,0,6,vertical),nl,
    mostra(P13,8,10,vertical),nl,
    mostra(P14,4,20,horitzontal),nl,
    gotoXY(30,0).

