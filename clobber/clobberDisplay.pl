
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

printMatrix([Head|Tail], N) :-   
    write(' '),   
    N1 is N + 1,
    write(N),
    write(' | '),
    printLine(Head),
    write('\n   |---|---|---|---|---|\n'),
    printMatrix(Tail, N1).

%caso base
printLine([]).
printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    write(' | '),
    printLine(Tail).


tabuleiroInicial(Board,getPeca(+Linha,+Coluna,+Tabuleiro,-Peca)).
tabuleiroInicial(Board,setPeca(+Linha,+Coluna,+Tabuleiro,+Peca,-TabOut)).

validMove(estadoTotal(tab, jogador),jogada,novoTab, novoJogo).

%para ter a avaliacao do tabuleiro
evalBoard(Tab,J, val).

%para termos todas as jogadas validas
%depois eh so usar a random library
findall(jog, validMove( tab, j , jog, NT, NJ ), L).

%val_jog eh o valor da jogada avaliado o tabuleiro apos a jogada
setOf(val_jog, (validMove(tab,J,jog,NT,NJ),evalBoard(Tab,J, val) ), L ).
