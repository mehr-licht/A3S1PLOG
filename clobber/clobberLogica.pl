/**
* checkDifferenceIndexs(+RowIndex,+ColumnIndex,+PP_RowIndex,+PP_ColumnIndex)
* @brief Certifica o tipo de movimentacao conforme se queira mover 
* entre linhas ou colunas (com diferença de 1 indice)
* @param +RowIndex: linha actual
* @param +ColumnIndex: coluna actual
* @param +PP_RowIndex: praxima linha
* @param +PP_ColumnIndex: proxima coluna
*/
checkDifferenceIndexs(RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex):-
        RowIndex - PP_RowIndex =:= 0,
        !,
        abs(ColumnIndex - PP_ColumnIndex) =:= 1.
checkDifferenceIndexs(RowIndex,_ColumnIndex,PP_RowIndex,_PP_ColumnIndex):-
        abs(RowIndex - PP_RowIndex) =:= 1.
        
/**
 * move(+TabuleiroInicial, +RowIndex, +ColumnIndex, +PP_RowIndex, +PP_ColumnIndex, -TabuleiroFinal, +Color)
 * @brief Validar  e executar a jogada das pecas brancas
 * @param +TabuleiroInicial -> board status before the move
 * @param +RowIndex -> linha da peca selecionada que vai se movimentar 
 * @param +ColumnIndex -> coluna da peca selecionada que vai se movimentar
 * @param +PP_RowIndex -> Linha da P.roxima P.osicao 
 * @param +PP_ColumnIndex -> Coluna da P.roxima P.osicao
 * @param +Color -> black or white : which piece to move
 * @param -TabuleiroFinal -> board status after the move   
*/
move(TabuleiroInicial, RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex, TabuleiroFinal, Color):-
    getValueFromMatrix(TabuleiroInicial, RowIndex, ColumnIndex, ValueJogador),
    ValueJogador == Color, 
    write('Peca escolhida valida\n'),
    getValueFromMatrix(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, ValueAdversario),
    ValueJogador == white , 
    !,
    ValueAdversario == black,
    write('Jogada Valida'),
    replaceInMatrix(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, Color, TabuleiroNovo),
    replaceInMatrix(TabuleiroNovo, RowIndex, ColumnIndex, empty, TabuleiroFinal).

/*
* @brief (vide anterior) validar a jogada das pecas pretas
*/
move(TabuleiroInicial, RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex, TabuleiroFinal, Color):-
    getValueFromMatrix(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, ValueAdversario),
    ValueAdversario == white,
    write('Jogada Valida'),
    replaceInMatrix(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, Color, TabuleiroNovo),
    replaceInMatrix(TabuleiroNovo, RowIndex, ColumnIndex, empty, TabuleiroFinal).


/**
 * selecionarProximaPosicao(+TabuleiroInicial, -RowIndex, -ColumnIndex, +ColorPlayer)
 * @brief Obtem os valores da proxima posicao pretendida e verifica a sua validade
 * @param +TabuleiroInicial: tabuleiro actual
 * @param -RowIndex: Linha pretendida
 * @param -ColumnIndex: Coluna pretendida
 * @param +ColorPlayer: cor do adversário
 *  
 */
 selecionarProximaPosicao(TabuleiroInicial, RowIndex, ColumnIndex, ColorPlayer):-
        manageRow(NewRow),
        manageColumn(NewColumn),
        ColumnIndex is NewColumn -1,
        RowIndex is NewRow -1,
        getValueFromMatrix(TabuleiroInicial, RowIndex, ColumnIndex, ValueAdversario),
        ValueAdversario = ColorPlayer,
        !,
        write('Peca escolhida valida\n').
selecionarProximaPosicao(TabuleiroInicial, RowIndex, ColumnIndex, ColorPlayer):-
        write('Posicao INVALIDA - seleccionar Proxima Posicao em que esteja uma peca '),write(ColorPlayer),nl, 
        selecionarProximaPosicao(TabuleiroInicial, RowIndex, ColumnIndex, ColorPlayer).
        
/**
 * selecionarPeca(+TabuleiroInicial, -NewRow, -NewColumn, -RowIndex, -ColumnIndex, +ColorPlayer)
 * @brief Selecionar a peca do jogador com certificacao da sua validade da peca seleccionada (white AND black)
 * Le o input de linha e coluna
 * Calcula os indexes para a peca
 * Procura no tabuleiro e verifica se a cor da posicao eh igual a calculada no tabuleiro
 * @param +TabuleiroInicial: tabuleiro actual
 * @param -NewRow: linha escolhida
 * @param -NewColumn: coluna escolhida
 * @param -RowIndex: indice da linha escolhida
 * @param -ColumnIndex: indice da coluna escolhida
 * @param +ColorPlayer: cor da peca a ser seleccionada para mover
 */ 
selecionarPeca(TabuleiroInicial, NewRow, NewColumn, RowIndex, ColumnIndex, ColorPlayer):-
        manageRow(NewRow),
        manageColumn(NewColumn),
        ColumnIndex is NewColumn -1,
        RowIndex is NewRow -1,
        getValueFromMatrix(TabuleiroInicial, RowIndex, ColumnIndex, ValueAdversario),
        ValueAdversario = ColorPlayer,
        !,
        write('Peca escolhida valida\n').
selecionarPeca(TabuleiroInicial, NewRow,NewColumn,RowIndex,ColumnIndex, ColorPlayer):-
        write('Peca NAO valida - tem de escolher uma peca '),write(ColorPlayer),nl,
        selecionarPeca(TabuleiroInicial, NewRow,NewColumn,RowIndex,ColumnIndex, ColorPlayer).


%##########################################################################################################################
%##########################################################################################################################        
/**
 * @brief Jogada do P1 - pecas white
 * NOTA: numero de linha 1-6, numero de coluna 1-5, indexL 0-5 indeC 0-4 
*/
%playJogador_1_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
%        gameOver(Tabuleiro, white),
%        !,
%        anounce(white).
/**
 * @brief turno do jogador 1 (brancas), pergunta qual a peca e para onde a mover, verificando validades
 * @param +TabuleiroInicial: tabuleiro actual
 * @param -NovoTabuleiroInicial: tabuleiro actualizado apos a jogada
 * @param +type of player (P=person; C=bot)
 */
playJogador_1_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):- 
        write('Jogador 1  -> pecas brancas\n'), 
        write('Escolha a peca white a mover:\n'),
        selecionarPeca(TabuleiroInicial, _NewRow, _NewColumn, RowIndex, ColumnIndex, white), 
        write('Escolha a posicao para mover a peca white:\n'),
        selecionarProximaPosicao(TabuleiroInicial, PP_RowIndex,PP_ColumnIndex, black),
        checkDifferenceIndexs(RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex),
        !,
        move(TabuleiroInicial, RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex,  NovoTabuleiro, white),
        write('####   Valid move  ######\n').
playJogador_1_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
        write('Posicao NAO VALIDA - tem de escolher uma peca white'),
        playJogador_1_Turno(TabuleiroInicial, NovoTabuleiro, 'P').

playJogador_1_Turno(TabuleiroInicial, _NovoTabuleiro, 'C'):-
        write('Jogador Bot -> pecas brancas\n'), 
        jogarLeBot(TabuleiroInicial, _TabuleiroFinal).




/**
 * @brief Jogada do P2 - pecas black
*/
%playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
%        gameOver(Tabuleiro, Winer, black),
%        !,
%        anounce(black).
/**
 * @brief turno do jogador 2 (pretas), pergunta qual a peca e para onde a mover, verificando validades
 * @param +TabuleiroInicial: tabuleiro actual
 * @param -NovoTabuleiroInicial: tabuleiro actualizado apos a jogada
 * @param +type of player (P=person; C=bot)
 */
playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
        write('Jogador 2 -> pecas pretas\n'), 
        write('Escolha a peca black a mover:\n'),
        selecionarPeca(TabuleiroInicial, _NewRow, _NewColumn, RowIndex, ColumnIndex, black),
        write('Escolha a posicao para mover a peca black:\n'),
        selecionarProximaPosicao(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, white),
        checkDifferenceIndexs(RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex),
        !,
        move(TabuleiroInicial, RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex, NovoTabuleiro, black),
        write('####   Valid move  ######\n').
playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
        write('Posicao NAO VALIDA - tem de escolher uma peca black'),
        playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'P').


/**
 * @brief Jogada do BOT - pecas black
 * playJogador_2_Turno(+TabuleiroInicial, -NovoTabuleiro, +'C') 
*/
%playJogador_2_Turno(_TabuleiroInicial, _NovoTabuleiro, 'C'):-            
%        gameOver(Tabuleiro,black),
%        !,
%        anounce(black).
playJogador_2_Turno(TabuleiroInicial, _NovoTabuleiro, 'C'):-
        write('Jogador Bot -> pecas pretas\n'), 
        jogarLeBot(TabuleiroInicial, _TabuleiroFinal).


%#######################################################################################################################
anounce(Color):-
        write('We are the Loosers ->'),
        write(Color),
        write('pieces').
/**
 * @brief
 * gameOver(+Tabuleiro, -Winer) Winner == Color 
*/
gameOver(Tabuleiro, Winer):-
        jogadasPossiveis(Tabuleiro,Winer,ListaDePares),
        ListaDePares == [].

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
