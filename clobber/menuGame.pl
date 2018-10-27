% imprime menu inicial para futura escolha do modo de jogo
mainMenu :-
    printMainMenu, askOption, read(Input), managerInput(Input).

managerInput(1) :-
    startGame('P','P'), mainMenu.

managerInput(2) :-
    startGame('P','C'), mainMenu.

managerInput(3) :-
    startGame('C','C'), mainMenu.

% Opcao escondida para ter acesso rapido ao tabuleiro 
managerInput(4) :-
    write('valid option!\n\n'), printBoard(X), write('\nEntrou\n').

managerInput(0) :-
    write('\nExiting...\n\n').

managerInput(_Other) :-
    write('\nERROR: On input\n\n'), askOption, read(Input), managerInput(Input).

printMainMenu :-
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                          1. Player vs Player                          |'),nl,
    write('|                                                                       |'),nl,
    write('|                          2. Player vs Bot                             |'),nl,
    write('|                                                                       |'),nl,
	write('|                          3. Bot vs Bot                                |'),nl,
    write('|                                                                       |'),nl,
    write('|                          0. Exit                                      |'),nl,
    write('|_______________________________________________________________________|'),nl,nl,nl.

askOption :-
    write('> Insert option ').