factorial(0,1).
factorial(N, V):-
N>0,
N2 is N - 1, factorial(N2,N3),
V is N * N3.
%factorial(3,X). dah 6.

