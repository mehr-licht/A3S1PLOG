membro(X,[X|_]).
membro(X,[_|Ys]):-membro(X,Ys).
list([1,2,3,4,5]).
