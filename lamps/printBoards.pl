
makingOfBoard(SizeInput):-
    makeBoard(SizeInput, Tabuleiro, NewSize),
    printMatrix(Tabuleiro, NewSize),
    write('Well Done').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Print Tabuleiro
/**
 * @brief predicado de preenchimento da casa vazia
 * @param S: simbolo a ser imprimido
 */
symbol(empty,S) :- S =' . '.

/**
 * printMatrix(Tabuleiro, N) 
 * @brief Percorrer e imprimir a matrix (caso base e passo recursivo)
 * @param N: indice da linha, a mostrar no inicio de cada uma
 * @param +Tabuleiro: tabuleiro
*/
printMatrix([], 0).
printMatrix([Head|Tail], N) :-   
    write('  '),   
    N1 is N - 1,
    write(' | '),
    printLine(Head),
    write('\n   |---|---|---|---|\n'),
    printMatrix(Tail, N1).

/**
 * @brief Caso base e impressao da linha de tabuleiro
 * @param (parte do) tabuleiro passado como [Head|Tail]
 */
printLine([]).
printLine([Head|Tail]) :-
    write(Head),
    write(' | '),
    printLine(Tail).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Build Tabuleiro

/**
 * makeBoard(+SizeInput, -Tabuleiro, -NewSize)
 * param SizeInput -> Numero de linhas e de colunas 
 * construi ja as listas para as solucoes nas celulas limite
*/
makeBoard(SizeInput, Tabuleiro,NewSize):-
    NewSize is SizeInput + 2,
    buildLists(0, NewSize, List), %se for 2X2 constroi uma lista de 4 valores [] em qe S1 A1 A2 S2
    buildMatrix(List, NewSize, Tabuleiro).

/**
 * @param Build matrix NxN -> buildMatrix(+List, +N, -Tabuleiro)
 * @param List lista construida
 * @param Numero de linhas
 * @return Tabuleiro Devolve tabuleiro construido 
*/
buildMatrix(List, N, Tabuleiro):-
    length(Tabuleiro,N),
    maplist(=(List),Tabuleiro).

/**
 * buildLists(+X, +N, -List)
 * @param X value in every list's index
 * @param N the size of the list - linha
 * @return List  lista construída 
*/
buildLists(X, N, List):- 
    length(List, N), 
    maplist(=(X), List).
