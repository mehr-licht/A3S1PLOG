/**
 * @param SizeInput Corresponde ao tamanho do tabuleiro central, sem as solucoes 
*/

makingOfBoard(SizeInput):-
    makeBoard(SizeInput, Tabuleiro, NewSize), %NewSize is SizeInput + 2
    adjustBoard(Tabuleiro, NewTabuleiro,NewSize),
    printMatrix(NewTabuleiro, NewSize), %-> print an empty N-size matrix filled with zeros
    fillSides(NewTabuleiro, NewSize, FinalTabuleiro, SolutionsLista),
    cleanSolutionsLista(SolutionsLista, NewSolutionsLista), % Size [4x4] Sem os valores dos cantos que nao interessam
    nl,
    write('New Board without the Middle Values'),
    nl,
    printMatrix(FinalTabuleiro, NewSize),
    nl,
    write('Future Solutions to Fill the middle:'), 
    nl,
    printLine(NewSolutionsLista),
    nl, nl,
    write('to continue press 0.'),
    nl,
    askOption,nl,
    repeat,
    read(TeclaEntrada),
    (
        ( (TeclaEntrada == 0 ; TeclaEntrada == 1 ), write('OPCAO VALIDA') )
        ;
        ( (TeclaEntrada \= 0 , TeclaEntrada \=1 ) , write('Opcao Invalida. escreva ?- 0.') )      
     ),
    filling(FinalTabuleiro, NewSolutionsLista, SizeInput).


%solvingMiddle(FinalTabuleiro,Size,SolutionsLista):-
%    printMatrix(FinalTabuleiro, Size),
%    nl,
%    write('Size: '),
%    write(Size),
%    nl,
%    write(SolutionsLista).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  SolutionsLista

cleanAUXFirst([_|T], NewLista):-
    NewLista = T.
cleanAUXLast([_], []).
cleanAUXLast([X|Xs], [X|Last]) :- 
    cleanAUXLast(Xs, Last).
cleaning(H, CleanedLista):-
    cleanAUXFirst(H, NewLista),
    cleanAUXLast(NewLista, CleanedLista).
    
cleanSolutionsLista([],[]).
cleanSolutionsLista([H|T], [CleanedLista | NewSolutionsLista]):-
    cleaning(H, CleanedLista),
    cleanSolutionsLista(T, NewSolutionsLista).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Print Tabuleiro

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
    printLine(Head),nl,
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
 * Preenchimento dos
 * @brief predicado de preenchimento da casa vazia nos 4 cantos
 * @param adjustBoard(+Tabuleiro,-NovoTabuleiro,+SizeInput)
 */
adjustBoard(Tabuleiro,NovoTabuleiro,SizeInput):-
    NewSizeInput is SizeInput - 1,
    replaceInMatrix(Tabuleiro, 0, 0, '.', TabuleiroUm),
    replaceInMatrix(TabuleiroUm, NewSizeInput, NewSizeInput, '.', TabuleiroDois),
    replaceInMatrix(TabuleiroDois, 0, NewSizeInput, '.', TabuleiroTres),
    replaceInMatrix(TabuleiroTres, NewSizeInput, 0, '.', NovoTabuleiro).
    

/**
 * makeBoard(+SizeInput, -Tabuleiro, -NewSize)
 * param SizeInput -> Numero de linhas e de colunas 
 * construi ja as listas para as solucoes nas celulas limite
 * makeBoard(+SizeInput,-Tabuleiro, -NewSize)
*/
makeBoard(SizeInput, Tabuleiro, NewSize):-
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
