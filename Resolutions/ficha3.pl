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