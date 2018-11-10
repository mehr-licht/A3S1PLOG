
fact(1,Acc,Acc).
fact(N,F,Acc):-
N>1,
N2 is N - 1,
Acc2 is Acc * N,
fact(N2,F,Acc2).
%fact(3,X,1). dah 6.

