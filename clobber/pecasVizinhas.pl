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
 * @brief Verifica qual a peca em determinada celula, percorrendo toda a matriz e chamando o predicado getColorLinha para cada linha
 * @param +TabuleiroInicial: tabuleiro actual
 * @param +Line: linha da celula em questao
 * @param +Coluna: coluna da celula em questao
 * @param -Color: cor da celula pesquisada
*/
getColorMatrix(TabuleiroInicial, Line, Coluna, Color):-
    nth0(Line,TabuleiroInicial,Linha),
    getColorLinha(Linha, Coluna, Color).


/** 
 * checkarPecaVizinhaValiada(+TabuleiroInicial, +Line, +Column, -Color, -LinhaEColuna)
 * @brief verifica para quais das 4 direccoes possiveis dos moves existe uma jogada valida e devolve lista com as possiveis
 * @param +TabuleiroInicial: tabuleiro actual
 * @param +Line da peca a jogar
 * @param +Column da peca a jogar
 * @param -Color : eh o estado  que a casa seguite tem de ter, eh a cor do adversario
 * se a peca em linha-coluna for de cor preta, entao +Color = white.
 * @param -LinhaEColuna lista de pares Linha-Coluna correspondendo a celula para onde se move, ja com verifficacao
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
 * jogadasValidasPorPeca(Tabuleiro,LineIndex, ColumnIndex, _CorContraria, ListaDePares)
 * @brief: devolve lista com jogadas validas para a peca em determinada celula
 *  @param +Tabuleiro: tabuleiro actual
 *  @param +LineIndex: indice da linha da celula da peca
 *  @param +ColumnIndex:  indice da coluna da celula da peca
 * @param CorContraria eh a cor contraria ah peca que esta na posicao [LineIndex-ColumnIndex]
 * @param CorContraria eh a cor contraria ah peca que esta na posicao [LineIndex-ColumnIndex]
 *  @param -ListaDePares: lista com jogadas validas para a peca que esta na celula, no formato par linha-coluna
*/
jogadasValidasPorPeca(Tabuleiro,LineIndex, ColumnIndex, _CorContraria, ListaDePares):-
    findall([Line-Column],checkarPecaVizinhaValiada(Tabuleiro, LineIndex, ColumnIndex, white,[Line-Column]), ListaDePares).