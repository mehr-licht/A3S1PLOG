
initialBoard([
    [black,white,black,white,black],
    [white,black,white,black,white],
    [black,white,black,white,black],
    [white,black,white,black,white],
    [black,white,black,white,white],
    [white,black,black,black,white]
]).

symbol(empty,S) :- S ='.'.
symbol(black,S) :- char_code(S,9863). 
symbol(white,S) :- char_code(S,9865). 

%char_code(Char,9863), write(Char).
%9863
%9865

printBoard(X):- nl, initialBoard(X), write('\n   | A | B | C | D | E |\n'), write('   |---|---|---|---|---|\n'), printMatrix(X, 1).

printMatrix([], 6).

%letter(N, L),
%write(L), write('\n  | A | B |C | D | E |\n'),
printMatrix([Head|Tail], N) :-   
    write(' '),   
    N1 is N + 1,
    write(N),
    write(' | '),
    printLine(Head),
    write('\n   |---|---|---|---|---|\n'),
    printMatrix(Tail, N1).

printLine([]).

printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    write(' | '),
    printLine(Tail).

