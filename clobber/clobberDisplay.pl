
initialBoard([
    [black,white,black,white,black],
    [white,black,white,black,white],
    [black,white,black,white,black],
    [white,black,white,black,white],
    [black,white,black,white,black],
    [white,black,white,black,white]
]).


symbol(empty,S) :- S ='.'.
symbol(black,S) :- char_code(S,9863).  
symbol(white,S) :- char_code(S,9865). 

%char_code(Char,9863), write(Char).
%9863
%9865

printBoard(X):- nl, write('\n   | A | B | C | D | E |\n'), write('   |---|---|---|---|---|\n'), printMatrix(X, 1).

/**
 * @brief Percorrer e imprimir a matrix
 * 
*/
printMatrix([], 7).
printMatrix([Head|Tail], N) :-   
    write(' '),   
    N1 is N + 1,
    write(N),
    write(' | '),
    printLine(Head),
    write('\n   |---|---|---|---|---|\n'),
    printMatrix(Tail, N1).

/**
 * @brief Caso base e impressao da linha
 * 
 */
printLine([]).
printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    write(' | '),
    printLine(Tail).


