female(sara).
female(christina).
female(lisa).
female(ella).
male(lincoln).
male(aldo).
male(lj).
male(michael).
parent(aldo,lincoln).
parent(christina,lincoln).
parent(aldo,michael).
parent(christina,michael).
parent(lisa,lj).
parent(lincoln,lj).
parent(michael,ella).
parent(sara,ella).


%parent(X,michael).
son(Y,X):-parent(X,Y),male(Y).
father(X,Y):-parent(X,Y),male(X).

