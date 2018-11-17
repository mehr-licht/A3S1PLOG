/**
 testeBoard(X),findall([Line-Column],checkarPecaVizinhaValiada(X, 2, 2, white,[Line-Column]), ListaDePares).
X = [
    [empty,empty,empty,empty,empty],
    [empty,black,white,black,empty],
    [empty,white,black,empty,black],
    [white,white,empty,black,empty],
    [empty,white,empty,white,empty],
    [empty,black,empty,empty,empty]],
ListaDePares = [[2-1],[1-2]] ? 
*/

/**
 * getColorLinha(+Linha, +Coluna, -Color) 
 * @brief Verifica qual a peca em determinada celula (ou se vazio)
 * @param +Linha: linha da celula a verificar
 * @param +Coluna: coluna da celula a verificar
 * @param -Color: cor da celula verificada
*/
getColorLinha(Linha, Coluna, Color):-
    nth0(Coluna, Linha, Color).

/**
 * getColorMatrix(+TabuleiroInicial, +Line, +Coluna, -Color) 
 * @brief 
 * @param
 * @param
 * @param
 * @param 
*/
getColorMatrix(TabuleiroInicial, Line, Coluna, Color):-
    nth0(Line,TabuleiroInicial,Linha),
    getColorLinha(Linha, Coluna, Color).


/** 
 * checkarPecaVizinhaValiada(TabuleiroInicial, Line, Column, Color, [Line-NewColumnIndex])
 * @param Linha da peca a jogar
 * @param Colunha da peca a jogar
 * @ Color : eh o estado  que a casa seguite tem de ter, eh a cor do adversario
 * se a peca em linha-coluna for de cor preta, entao +Color = white.
 * checkarPecaVizinhaValiada(+TabuleiroInicial, +Line, +Column, +Color, -[Line-NewColumnIndex]) 
*/
checkarPecaVizinhaValiada(TabuleiroInicial, Line,Column,Color,[Line-NewColumnIndex]):-
    NewColumnIndex is Column -1,
    between(0,5,Line),
    between(0,4,NewColumnIndex),
    getColorMatrix(TabuleiroInicial, Line, NewColumnIndex, ValueAdversario),
    ValueAdversario == Color.

checkarPecaVizinhaValiada(TabuleiroInicial,Line,Column,Color,[Line-NewColumnIndex]):-
    NewColumnIndex is Column +1,
    between(0,5,Line),
    between(0,4,NewColumnIndex),
    getColorMatrix(TabuleiroInicial, Line, NewColumnIndex, ValueAdversario),
    ValueAdversario == Color.

checkarPecaVizinhaValiada(TabuleiroInicial, Line,Column,Color, [NewLineIndex-Column]):-
    NewLineIndex is Line - 1,
    between(0,5,NewLineIndex),
    between(0,4,Column),
    getColorMatrix(TabuleiroInicial, NewLineIndex,Column, ValueAdversario),
    ValueAdversario == Color.

checkarPecaVizinhaValiada(TabuleiroInicial, Line,Column,Color,[NewLineIndex-Column]):-
    NewLineIndex is Line + 1,
    between(0,5,NewLineIndex),
    between(0,4,Column),
    getColorMatrix(TabuleiroInicial, NewLineIndex, Column, ValueAdversario),
    ValueAdversario == Color.

/**
 * @param CorContraria eh a cor contraria ah peca que esta na posicao [LineIndex-ColumnIndex]
*/
jogadasValidasPorPeca(Tabuleiro,LineIndex, ColumnIndex, _CorContraria, ListaDePares):-
    findall([Line-Column],checkarPecaVizinhaValiada(Tabuleiro, LineIndex, ColumnIndex, white,[Line-Column]), ListaDePares).