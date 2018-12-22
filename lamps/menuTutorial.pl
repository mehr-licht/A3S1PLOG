/**
 * 
 * */
printTutorialMainMenu(1):- 
    explanationMenu,
    askOption, 
    repeat,
    read(TeclaEntrada),
    (
        ( (TeclaEntrada == 0 ; TeclaEntrada == 1 ), write('OPCAO VALIDA') )
        ;
        ( (TeclaEntrada \= 0 , TeclaEntrada \=1 ) , write('Opcao Invalida. escreva ?- 0.') )      
     ),      
    managerInputTutorial(TeclaEntrada).


/**
 * @brief Deal with the first input
*/
managerInputTutorial(0):-
    write('\nExiting...\n\n').
managerInputTutorial(1):-
    printChooseSize,
    askOption, 
    repeat,
    read(SizeInput),
    (
     between(4,9,SizeInput), write('OPCAO VALIDA')      
    ),
    printBoard(SizeInput).


printChooseSize:-
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                   Greetings, welcome to LAMPS                         |'),nl,
    write('|                                                                       |'),nl,
    write('|  # Choose the board size:                                             |'),nl, 
    write('|                    Default size: 4 x 4                                |'),nl,
    write('|                                                                       |'),nl,
    write('|                    Choose an integer between 4 and 9                  |'),nl,
    write('|                    OR 0. to exit                                      |'),nl,   
    write('|                    0. Exit                                            |'),nl,
    write('|_______________________________________________________________________|'),nl,nl,nl.



/**
 * @brief pede a opcao do jogo que se pretende
 */
askOption :-
    write(' Insert OPTION.').


explanationMenu:-
    nl,nl,
    write(' _______________________________________________________________________ '),nl,
    write('|                   Greetings, welcome to LAMPS                         |'),nl,
    write('|                                                                       |'),nl,
    write('|  # Identify the intensity of every lamp located in the empty cells    |'),nl, 
    write('|                    around the grid.                                   |'),nl,
    write('|                                                                       |'),nl, 
    write('|  # Some lamps may have zero  intensity.                               |'),nl,
    write('|                                                                       |'),nl, 
    write('|  # Other lamps shine into the grid in one horizontal and two          |'),nl,
    write('|                       diagonal directions.                            |'),nl,
    write('|                                                                       |'),nl,     
    write('|  # The intensity of the lamp identifies the number of cells lit by    |'),nl,
    write('|                     the lamp in each direction.                       |'),nl, 
    write('|                                                                       |'),nl, 
    write('|  # Numbers in the grid identify how many lamps  illuminate the        |'),nl,
    write('|                         corresponding cell                            |'),nl,
    write('|                                                                       |'),nl, 
	write('|            Press <1> key for a puzzle                                 |'),nl,
    write('|                          1. Lamps                                     |'),nl,
    write('|                          0. Exit                                      |'),nl,
    write('|_______________________________________________________________________|'),nl,nl,nl.

