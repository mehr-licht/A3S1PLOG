

printTutorialMainMenu:- 
    printFirstMainMenu,
    askOption, 
    repeat,
    read(TeclaEntrada),
    (
      ( TeclaEntrada == 0, write('OPCAO VALIDA') )
        ;
        (TeclaEntrada \= 0, write('Opcao Invalida. escreva ?- 0.')
      )      
     ),      
    managerInputTutorial(TeclaEntrada).

managerInputTutorial(0):-
    mainMenu.
managerInputTutorial(1) :-
    write('\nExiting...\n\n').


printFirstMainMenu:-
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|           Greetings, welcome to CLOBBER                               |'),nl,
    write('|                                                                       |'),nl,
    write('|     Your piece can only move and at same time eat another piece       |'),nl,
    write('|                       with a different color.                         |'),nl,
    write('|     Your piece only can move in 4 directions: north, south,           |'),nl,
    write('|                          west or west.                                |'),nl, 
    write('|     Your piece can only move to the adjacent square                   |'),nl,
    write('|                                                                       |'),nl,
    write('|            Press <0> key for a play                                   |'),nl,
    write('|                          0. Play                                      |'),nl,
    write('|                          1. Exit                                      |'),nl,
    write('|_______________________________________________________________________|'),nl,nl,nl.




/**
 * @brief imprime menu inicial para futura escolha do modo de jogo
 */
mainMenu :-
    printMainMenu, askOption, read(TeclaEntrada), managerInput(TeclaEntrada).

/**
 * @brief imprime menu de opcoes de nivel do Bot
 * @param -Nivel: Nivel escolhido para o Bot
 * @param +Qual: Bot para o qual se escolheu este nivel
 */
botMenu(Nivel,Qual) :-printBotMenu(Qual), askOption, read(Nivel).

/**
 * managerInput(+opcao)
 * @brief lanca o modo de jogo escolhido
 * @param +opcao inteiros de 0 a 5 que correspondem à escolha do modo de jogo (player, bot, etc)
 */
managerInput(1) :-
    startGame('P','P'), mainMenu.

managerInput(2) :-
   % botMenu(Nivel,0),
    startGame('P','C'), mainMenu.%A se random e I se clever

managerInput(3) :-
  %  botMenu(Nivel,0),
    startGame('P','I'), mainMenu.%A se random e I se clever

managerInput(4) :-
  %  botMenu(Nivel1,1),
 %   botMenu(Nivel2,2),
    startGame('C','I'), mainMenu.%A se random e I se clever

% Opcao escondida para ter acesso rapido ao tabuleiro 
managerInput(5) :-
    write('valid option!\n\n'), printBoard(_X), write('\nEntrou\n').

managerInput(0) :-
    write('\nExiting...\n\n').

managerInput(_OutroInput) :-
    write('\nERROR: Please input an integer between 0 and 4\n\n'), askOption, read(Input), managerInput(Input).


/**
 * @brief imprime o menu principal com as opcoes que podem ser escolhidas
 * 
 */
printMainMenu :-
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                          1. Player vs Player                          |'),nl,
    write('|                                                                       |'),nl,
    write('|                          2. Player vs Bot Random                      |'),nl,
    write('|                                                                       |'),nl,
    write('|                          3. Player vs Bot Int                         |'),nl,
    write('|                                                                       |'),nl,
	write('|                          4. Bot Random vs Bot Int                     |'),nl,
    write('|                                                                       |'),nl,
    write('|                          0. Exit                                      |'),nl,
    write('|_______________________________________________________________________|'),nl,nl,nl.

/**
 * @brief imprime menu de opcoes de nivel do Bot
 * 
 */
printBotMenu(Qual) :-
    Qual == 0,!,
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                                                                       |'),nl,
    write('|                        Qual o nivel do Bot?                           |'),nl,
    write('|                                                                       |'),nl,
    write('|                          A. Aleatorio                                 |'),nl,
    write('|                                                                       |'),nl,
    write('|                          I. Inteligente                               |'),nl,
    write('|                                                                       |'),nl,
    write('|_______________________________________________________________________|'),nl,nl,nl.

printBotMenu(Qual) :-
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                                                                       |'),nl,
    write('|                        Qual o nivel do Bot '),write(Qual),write('?                          |'),nl,
    write('|                                                                       |'),nl,
    write('|                          A. Aleatorio                                 |'),nl,
    write('|                                                                       |'),nl,
    write('|                          I. Inteligente                               |'),nl,
    write('|                                                                       |'),nl,
    write('|_______________________________________________________________________|'),nl,nl,nl.
/**
 * @brief pede a opcao do jogo que se pretende
 *-
 */
askOption :-
    write('> Insert option ').


