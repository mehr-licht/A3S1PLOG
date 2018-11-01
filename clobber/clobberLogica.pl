%jogador 1 -> brancas
%jogador 2 -> pretas

%modificarTabuleiro(TabuleiroInicial, NovoTabuleiro) :- 

%o jogador a jogar no turno se não tiver jogadas validas, perde o jogo.
%check game state
%condicaoFinaldeJogo(Tabuleiro, Cor_da_peca_a_avaliar):-
 %       write('Entrou na condicao final de jogo').

%validarJogada(Tabuleiro, JogadorCor, NovoTabuleiro, EsperadoNaPosicao, ColumnIndex, RowIndex):-
%getValueFromMatrix(Tabuleiro, RowIndex, ColumnIndex, EsperadoNaPosicao).


%verifica se a movimentacao eh ortogonal e ha uma peca de cor contraria
% RowIndex -> linha da peca selecionada que vai se movimentar
% ColumnIndex -> coluna da peca selecionada que vai se movimentar
% PP_RowIndex -> nova posicao
% PP_ColumnIndex -> nova posicao 
% 'preta' -> a nova posicao tem que conter uma peca preta
validarJogada(TabuleiroInicial, RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex,black):-
    getValueFromMatrix(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, Value),
    Value =:= black,
    !,
    replaceInMatrix(TabuleiroInicial, PP_RowIndex, PP_ColumnIndex, black, [H|TNew]),
    replaceInMatrix(TabuleiroInicial, RowIndex, ColumnIndex, empty, [H|TNew]).
    

  %  validarJogada(RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex,'preta')

%devolver os valores da posicao da peca, certificacao que eh valida, e preta
 selecionarProximaPosicao(RowIndex,ColumnIndex, black):-
        manageRow(NeWRow),
        manageColumn(NewColumn),
        write('\n 1 \n'),
        ColumnIndex is NewColumn -1,
        RowIndex is NewRow -1.

% o meu askCoordenates
selecionarPeca(NewRow,NewColumn,RowIndex,ColumnIndex):-
        manageRow(NewRow),
        manageColumn(NewColumn),
        write('\n 2 \n'),
        ColumnIndex is NewColumn -1,   % Em prolog nao ha indexes ???????
        RowIndex is NewRow -1.
       % validarJogada(Tabuleiro, JogadorCor, NovoTabuleiro, EsperadoNaPosicao, ColumnIndex, RowIndex).

playJogador_1_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):- 
        printBoard(TabuleiroInicial), 
        write('Jogador 1  -> pecas brancas\n'), 
        write('Escolha a peca a mover:\n'),
        selecionarPeca(NewRow, NewColumn,RowIndex,ColumnIndex), %numero de linha 1-6, numero de coluna 1-5, indexL 0-5 indeC 0-4
        write('Escolha a posicao:\n'),
        selecionarProximaPosicao(PP_RowIndex,PP_ColumnIndex, black),
        validarJogada(TabuleiroInicial, RowIndex,ColumnIndex,PP_RowIndex,PP_ColumnIndex, black),
        write('####   Valid move  ###### \n'),
%       modificarTabuleiro(TabuleiroInicial, NovoTabuleiro),
        printBoard(NovoTabuleiro).


playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, 'P'):-
        printBoard(TabuleiroInicial), 
        write('Jogador 2 -> pecas pretas\n'), 
        write('Escolha a peca a mover:\n'),
        % tabuleiro , novo tabuleiro, peca que vai comer, peca comida
    %    selecionarPeca(Tabuleiro, NovoTabuleiro, black, white),
%        modificarTabuleiro(),
        printBoard(NovoTabuleiro).

%alternar a sequencia de jogadas.
%a certificacao da condicao final do jogo efectua-se antes da jogada de cada jogador, porque antes de 
%dar possibilidade de jogar temos de verificar se existem jogadas validas - se nao existirem perde esse jogador 
gameLoop(Tabuleiro, Jogador1, Jogador2):-
    %    Jogador 1 ->(Tabuleiro , 'branca' )
   % condicaoFinaldeJogo(Tabuleiro, white),
    playJogador_1_Turno(Tabuleiro, NovoTabuleiro, Jogador1), 
    %    Jogador 2-> (Tabuleiro, 'preta')
    condicaoFinaldeJogo(NovoTabuleiro, black),
    playJogador_2_Turno(NovoTabuleiro, FinalTabuleiro, Jogador2),
    gameLoop(FinalTabuleiro, Jogador1, Jogador2).


% chamada recursiva no fim
startGame(Jogador1,Jogador2):- initialBoard(TabuleiroInicial), 
                                gameLoop(TabuleiroInicial, Jogador1, Jogador2).