
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

printBoard(X):- nl, initialBoard(X), write('\n   | A | B | C | D | E |\n'), write('   |---|---|---|---|---|\n'), printMatrix(X, 1).

printMatrix([], 7).

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


%tabuleiroInicial(Board,getPeca(+Linha,+Coluna,+Tabuleiro,-Peca)).
%tabuleiroInicial(Board,setPeca(+Linha,+Coluna,+Tabuleiro,+Peca,-TabOut)).

%jogada eh um termo composto de-para
%estadoActual é tabuleiroActual e Jogador que está a jogar (tab,jogador)
%validMove(tab, jogador, jogada, novoTab, novoJogador).

%para ter a avaliacao do tabuleiro apos jogada - val eh o valor atribuido a como vai ficar
%evalBoard(tab, jogador, val).

%para termos todas as jogadas validas
%depois eh so usar a random library
%findall(jog, validMove( tab, jogador, jogada, novoTabuleiro, novoJogador ), L).

%val_jog eh o valor da jogada avaliado o tabuleiro apos a jogada val_jog eh um termo composto val-jogada 
%setOf(val_jog, (validMove(tab, jpgador, jogada, novoTabuleiro, novoJogador), evalBoard(tab, jogador, val) ), L ).


%para encontrar o caminho mais curto entre 2 nos
%setOf(len-path, (path(start, end, path), length(path, len)), [slen-spath|_]).