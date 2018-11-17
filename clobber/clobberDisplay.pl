/**
 * @brief tabuleiro inicial do jogo
 * todas as casas preenchidas com  as pecas nas suas posicoes iniciais
 */
initialBoard([
    [black,white,black,white,black],
    [white,black,white,black,white],
    [black,white,black,white,black],
    [white,black,white,black,white],
    [black,white,black,white,black],
    [white,black,white,black,white]
]).

/**
 * @brief tabuleiro de teste num determinado momento do jogo
 */
testeBoard([
        [empty,empty,empty,empty,empty],
        [empty,black,white,black,empty],
        [empty,white,black,empty,black],
        [white,white,empty,black,empty],
        [empty,white,empty,white,empty],
        [empty,black,empty,empty,empty]
    ]).

/**
 * @brief tabuleiro de teste no fim do jogo
 * nenhum dos jogadores tem jogadas possíveis
 */
finalBoard([
        [empty,empty,empty,empty,empty],
        [empty,empty,black,black,empty],
        [empty,white,empty,empty,black],
        [white,white,empty,black,empty],
        [empty,white,empty,empty,empty],
        [empty,empty,empty,empty,empty]
    ]).

/**
 * @brief predicado que mostra o jogador em cada célula ou casa vazia
 * @param S: simbolo a ser imprimido, correspondente ao jogador em cada célula
 */
symbol(empty,S) :- S ='.'.
symbol(black,S) :- char_code(S,9863).  
symbol(white,S) :- char_code(S,9865). 

/**
 * @brief impressao do 'cabecalho' (indices das colunas) do tabuleiro
 * @param X: tabuleiro a ser imprimido 
 */
printBoard(X):- nl, write('\n   | A | B | C | D | E |\n'), write('   |---|---|---|---|---|\n'), printMatrix(X, 1).

/**
 * @brief Percorrer e imprimir a matrix (caso base e passo recursivo)
 * @param N: indice da linha, a mostrar no inicio de cada uma
 * @param tabuleiro como [Head|Tail]
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
 * @brief Caso base e impressao da linha de tabuleiro
 * @param (parte do) tabuleiro passado como [Head|Tail]
 */
printLine([]).
printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    write(' | '),
    printLine(Tail).


