%exerc5
member(X,[X|Xs]).
member(X,[Y|Ys]):-member(X,Ys).
%nomedalista([elementosdalista separadospor virgula])
mylist([1,2,3,4,5,6,7,8,9]).
%command call fort the list: mylist(QQ), member(3, QQ).
%mylist(QQ), member(3, QQ).
%nome(VAR),member(intElement,VAR)

% 
% _ eh uma variavel anonima
membro(X,L):-append(_,[X|Xs], Ys).

a(a1,1).
a(A,2).
a(a3,N).
b(1,b1).
b(2,B).
b(N,b3).
c(X,Y) :- a(X,N), b(N,Y).
d(X,Y) :- a(X,N), b(Y,N).
d(X,Y) :- a(N,X), b(N,Y).

lista([a,[b],c,[d]]) = lista([_|[X|X]]).
%-------------------------------------------------------------Append
append([],L,L).
append([X|L1],L2,[X|L3]):-append(L1,L2,L3).
%-------------------------------------------------------------listas invertidas
inverter(Lista,InvLista):-rev(Lista,[],InvLista).
rev([H|T],S,R):-rev(T,[H|S],R).
rev([],R,R).
%--------------------------------------------------------------

sumlist([],0).
sumlist([H|T],Soma):-
	sumlist(T,Rest),
	Soma is H+Rest.
