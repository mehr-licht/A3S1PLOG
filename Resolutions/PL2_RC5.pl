ePrimo(2).
ePrimo(3).
ePrimo(P):- integer(P), P>3, (P mod 2) =\= 0,  \+temFactor(P,3).
temFactor(N,L):- (N mod L) =:= 0.
temFactor(N,L):- (L * L) < N, L2 is (L + 2), temFactor(N, L2). 
