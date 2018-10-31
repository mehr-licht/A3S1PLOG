%jogador 1 -> brancas
%jogador 2 -> pretas

modificarTabuleiro(TabuleiroInicial, NovoTabuleiro) :- 

%o jogador a jogar no turno se não tiver jogadas validas, perde o jogo.
%check game state
condicao_Final_de_Jogo(Tabuleiro, Cor_da_peca_a_avaliar):-
        write('Entrou na condicao final de jogo').

selecionarPeca(Tabuleiro, PecaColuna, PecaLinha):-
        write('Coluna:\n'),
        read(PecaColuna),
        write('Linha:\n'),
        read(PecaLinha).

playJogador_1_Turno(TabuleiroInicial, NovoTabuleiro, Jogador1):- 
        printBoard(TabuleiroInicial), 
        write('Jogador 1  -> pecas brancas\n'), 
        write('Escolha a peca a mover\n'),
        selecionarPeca(Tabuleiro, PecaColuna, PecaLinha),
        modificarTabuleiro(TabuleiroInicial, NovoTabuleiro),
        printBoard(NovoTabuleiro).


playJogador_2_Turno(TabuleiroInicial, NovoTabuleiro, Jogador2):-
        printBoard(TabuleiroInicial), 
        write('Jogador 2 -> pecas pretas\n'), 
        write('Escolasa a passa'\n),
        selecionarPeca(Tabuleiro, PecaColuna, PecaLinha),
        modificarTabuleiro(),
        printBoard(NovoTabuleiro).

%alternar a sequencia de jogadas.
%a certificacao da condicao final do jogo efectua-se antes da jogada de cada jogador, porque antes de 
%dar possibilidade de jogar temos de verificar se existem jogadas validas - se nao existirem perde esse jogador 
gameLoop(Tabuleiro, Jogador1, Jogador2):-
    %    Jogador 1 ->(Tabuleiro , 'branca' )
    condicaoFinaldeJogo(Tabuleiro, 'branca'),
    playJogador_1_Turno(Tabuleiro, NovoTabuleiro, Jogador1); 
    %    Jogador 2-> (Tabuleiro, 'preta')
    condicaoFinaldeJogo(NovoTabuleiro, 'preta'),
    playJogador_2_Turno(NovoTabuleiro, FinalTabuleiro, Jogador2);
    gameLoop(FinalTabuleiro, Jogador1, Jogador2).


% chamada recursiva no fim
startGame(Jogador1,Jogador2):- initialBoard(TabuleiroInicial), 
                                gameLoop(TabuleiroInicial, Jogador1, Jogador2,).