%fibonacci(numeroTermos,valor)
fibonacci(0,1).
fibonacci(1,1).
fibonacci(N,F):-
N > 1,
N1 is N - 1, fibonacci(N1,F1),
N2 is N - 2, fibonacci(N2,F2),
F is F1 + F2.



factorial(0,1).
factorial(N,F):-
N > 0,
N2 is N-1 , 
factorial(N2,N3),
F is N * N3.



factorialCauda(N,F):-factorialCauda(N,F,1).
factorialCauda(1,Acc,Acc).
factorialCauda(N,F,Acc):-
N > 1,
N2 is N-1,
Acc2 is Acc*N,
factorialCauda(N2,F,Acc2).
