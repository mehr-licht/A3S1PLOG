
printBoard(SizeInput):-
    write('Well Done').




/**
 * @brief tabuleiro de teste num determinado momento do jogo
 */
testeBoard([
        [empty,empty,empty,empty],
        [empty,4,6,6,5,empty],
        [empty,5,2,6,4,empty],
        [empty,4,6,6,6,empty],
        [empty,4,6,6,4,empty],
        [empty,empty,empty,empty]        
    ]).

/**
 * #### MAKING OF THE VARIABLE BOARDS
 * @param X value in every list's index
 * @param N the size of the list 
*/
buildLists(X, N, List):- 
    length(List, N), 
    maplist(=(X), List).



/**
 * @brief predicado de preenchimento da casa vazia
 * @param S: simbolo a ser imprimido
 */
symbol(empty,S) :- S =' '.

printTotalBoard(X):- 
    nl,
    printHeader(X),
    printMatrix(X, 1),
    pritnFooter(X).

