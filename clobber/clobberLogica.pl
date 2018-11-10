/**
 * Certifica se a movimentacao eh para uma casa posicionada ao lado da peca - sentido norte, sul, este, oeste
*/
movimentationOnBoard(Index_1, Index_2):-
        Index_1 - Index_2 =:= 1.
movimentationOnBoard(Index_1, Index_2):-
        Index_2 - Index_1 =:= 1.
/**
* @brief Certifica o tipo de movimentacao
*/
checkDifferenceIndexs(RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex):-
        RowIndex - PP_RowIndex =:= 0,
        !,
        movimentationOnBoard(ColumnIndex, PP_ColumnIndex).
checkDifferenceIndexs(RowIndex,_ColumnIndex,PP_RowIndex,_PP_ColumnIndex):-
        movimentationOnBoard(RowIndex, PP_RowIndex).        

/**
 * @brief Validar a jogada do P1 - pecas brancas
 * @param RowIndex -> linha da peca selecionada que vai se movimentar 
 * @param ColumnIndex -> coluna da peca selecionada que vai se movimentar
 * @param PP_RowIndex -> Linha da P.roxima P.osicao 
 * @param PP_ColumnIndex -> Coluna da P.roxima P.osicao
 * @param 'preta' -> a nova posicao tem que conter uma peca preta   
*/
validarJogadaP1(TabuleiroInicial, RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex,black,TabuleiroFinal):-
    getValueFromMatrix(TabuleiroInicial, RowIndex, ColumnIndex, ValueJogador),
    ValueJogador = white,
    write('Peca escolhida valida\n'),
    !,
    getValueFromMatrix(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, ValueAdversario),
    ValueAdversario = black,
    write('Jogada Valida'),
    replaceInMatrix(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, white, TabuleiroNovo),
    replaceInMatrix(TabuleiroNovo, RowIndex, ColumnIndex, empty, TabuleiroFinal).
/*
* @brief validar a jogada do P2 - pecas pretas
*/
validarJogadaP2(TabuleiroInicial, RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex, white, TabuleiroFinal):-
    getValueFromMatrix(TabuleiroInicial, RowIndex, ColumnIndex, ValueJogador),
    ValueJogador = black,
    write('Peca escolhida valida\n'),
    !,
    getValueFromMatrix(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, ValueAdversario),
    ValueAdversario = white,
    checkDifferenceIndexs(RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex),
    write('Jogada Valida'),
    replaceInMatrix(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, black, TabuleiroNovo),
    replaceInMatrix(TabuleiroNovo, RowIndex, ColumnIndex, empty, TabuleiroFinal).


/**
 * @brief Obtem os valores da posicao da peca do adversario e verifica a sua validade 
 */
 selecionarProximaPosicao(TabuleiroInicial, RowIndex, ColumnIndex, ColorPlayer):-
        manageRow(NewRow),
        manageColumn(NewColumn),
        ColumnIndex is NewColumn -1,
        RowIndex is NewRow -1,
        getValueFromMatrix(TabuleiroInicial, RowIndex, ColumnIndex, ValueAdversario),
        ValueAdversario = ColorPlayer,
        !,
        write('Peca escolhida valida - linha selecionarProximaPosicao\n').
selecionarProximaPosicao(TabuleiroInicial, RowIndex, ColumnIndex, ColorPlayer):-
        write('Posicao INVALIDA - seleccioanrProximaPosicao\n'),
        selecionarProximaPosicao(TabuleiroInicial, RowIndex, ColumnIndex, ColorPlayer).
        
/**
 * @brief Selecionar a peca do jogador com certificacao da sua validade da peca seleccionada (white AND black)
 * Le o input de linha e coluna
 * Calcula os indexes para a peca
 * Procura no tabuleiro e verifica se a cor da posicao eh igual a calculada no tabuleiro
*/ 
selecionarPeca(TabuleiroInicial, NewRow, NewColumn, RowIndex, ColumnIndex, ColorPlayer):-
        manageRow(NewRow),
        manageColumn(NewColumn),
        ColumnIndex is NewColumn -1,
        RowIndex is NewRow -1,
        getValueFromMatrix(TabuleiroInicial, RowIndex, ColumnIndex, ValueAdversario),
        ValueAdversario = ColorPlayer,
        !,
        write('Peca escolhida valida - selecionarPeca \n').
selecionarPeca(TabuleiroInicial, NewRow,NewColumn,RowIndex,ColumnIndex, ColorPlayer):-
        write('Peca NAO valida\n'),
        selecionarPeca(TabuleiroInicial, NewRow,NewColumn,RowIndex,ColumnIndex, ColorPlayer).


%##########################################################################################################################
%##########################################################################################################################
        
/**
 * @brief Jogada do P1 - pecas white
 * NOTA: numero de linha 1-6, numero de coluna 1-5, indexL 0-5 indeC 0-4 
*/
%playJogador_1_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
%        game_over(Tabuleiro, Winer),
%        !,
%        anounce(Result).
playJogador_1_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):- 
        write('Jogador 1  -> pecas brancas\n'), 
        write('Escolha a peca a mover:\n'),
        selecionarPeca(TabuleiroInicial, _NewRow, _NewColumn, RowIndex, ColumnIndex, white), 
        write('Escolha a posicao:\n'),
        selecionarProximaPosicao(TabuleiroInicial, PP_RowIndex,PP_ColumnIndex, black),
        checkDifferenceIndexs(RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex),
        !,
        validarJogadaP1(TabuleiroInicial, RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex, black, NovoTabuleiro),
        write('####   Valid move  ######\n').
playJogador_1_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
        write('Posicao NAO VALIDA'),
        playJogador_1_Turno(TabuleiroInicial, NovoTabuleiro, 'P').

/**
 * @brief Jogada do P2 - pecas black
*/
%playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
%        game_over(Tabuleiro, Winer),
%        !,
%        anounce(Result).
playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
        write('Jogador 2 -> pecas pretas\n'), 
        write('Escolha a peca a mover:\n'),
        selecionarPeca(TabuleiroInicial, _NewRow, _NewColumn, RowIndex, ColumnIndex, black),
        write('Escolha a posicao:\n'),
        selecionarProximaPosicao(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, white),
        checkDifferenceIndexs(RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex),
        !,
        validarJogadaP2(TabuleiroInicial, RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex, white, NovoTabuleiro),
        write('####   Valid move  ######\n').
playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
        write('Posicao NAO VALIDA'),
        playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'P').

/**
 * @brief Jogada do BOT - pecas black
 * playJogador_2_Turno(+TabuleiroInicial, -NovoTabuleiro, +'C') 
*/
%playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'C'):-            TODO
%        game_over(Tabuleiro, Winer),
%        !,
%        anounce(Result).
playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'C'):-
        write('Jogador Bot -> pecas pretas\n'), 
        choose_move(TabuleiroInicial, NovoTabuleiro).
     


%#######################################################################################################################
/**
 * @brief
 * game_over(+Tabuleiro, -Winer) 
*/
game_over(Tabuleiro, Winer):-
        write("Game Over").

/**
 * @brief Alterna a sequencia de jogadas
 * gameLoop(+Tabuleiro, +Jogador1, +Jogador2) 
 * Chamada recursiva no fim
*/
gameLoop(Tabuleiro, Jogador1, Jogador2):-                                        
        printBoard(Tabuleiro),                                            
        playJogador_1_Turno(Tabuleiro, NovoTabuleiro, Jogador1), %    Jogador 1 ->(Tabuleiro , 'branca' ) 
        printBoard(NovoTabuleiro),
        playJogador_2_Turno(NovoTabuleiro, FinalTabuleiro, Jogador2), %  Jogador 2-> (Tabuleiro, 'preta')
        gameLoop(FinalTabuleiro, Jogador1, Jogador2).



/**
 * @brief Inicia o jogo
 * @ startGame(+Jogador1,+Jogador2) 
*/
startGame(Jogador1,Jogador2):- initialBoard(TabuleiroInicial), 
                                gameLoop(TabuleiroInicial, Jogador1, Jogador2).
