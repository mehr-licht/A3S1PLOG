
%teste iluminatiAux
%testVar([N1,N2,E1,E2,S1,S2,W1,W2]).
%testeDist([0-1-1, 0-2-1, 1-3-2, 2-3-0, 3-2-0, 3-1-2, 2-0-1, 1-0-1]).
%testeValor((1-1)-1).


%####################################################### PREDICADOS PARA CORRER TESTES
/*
runTestes(3):- 
        statistics(runtime, [T0|_]),
        testUnitarioV12(_),
        statistics(runtime, [T1|_]),
        T is T1 - T0,
        format('3x3 took ~16d sec.~n', [T]).
runTestes(4):- 
        statistics(runtime, [T0|_]),
        testUnitarioV16(_),
        statistics(runtime, [T1|_]),
        T is T1 - T0,
        format('4x4 took ~16d sec.~n', [T]).
runTestes(25):-
    statistics(runtime, [T0|_]),
    testUnitarioV20(Vars),
    fd_statistics(backtracks,Value),
    statistics(stack,Value2),
    statistics(runtime, [T1|_]),
    T is T1 - T0,nl,
    printLine(Vars),    
    write('Puzzle solved in: '),write(T),write('ms'),nl,
    write('backtracks: '),
    write(Value),  write( ': '),write(Value2).
runTestes2(25):- 
        write('Versao 2 do runTeste(25) '),
        statistics(runtime, [T0|_]),
        testUnitarioV20(_),
        statistics(runtime, [T1|_]),
        T is T1 - T0,
        format('5x5 took ~16d sec.~n', [T]).
*/


%##########################################################################################################
/**
 * RESOLUCAO CONFIRMADA para a resolucao das lampas
 * Resolicao confirmada para o preenchimento do tabuleiro interior
*/
testUnitarioV8(Vars):-
    % Vars = [N1,N2,E1,E2,S1,S2,W1,W2], 
    Vars = [ValorCelula1,ValorCelula2,ValorCelula3,ValorCelula4],
    %ValorCelula1 #= 6,               
    %ValorCelula2 #= 6,  
    %ValorCelula3 #= 5, 
    %ValorCelula4 #= 6,
    N1 = 2,
    N2 = 1,
    E1 = 2,
    E2 = 2,
    S1 = 2,
    S2 = 2,
    W1 = 2,
    W2 = 2,

    Distancia #= 2,                
    Dist1 #= 1,
    domain(Vars,0,8),
    calc21(N1,N2,E1,S2,W1,W2, Dist1, Distancia, ValorCelula1),
    calc22(N1,N2,E1,E2,S1,W2, Dist1, Distancia, ValorCelula2),
    calc23(E1,E2,W1,N2,S1,S2, Dist1, Distancia, ValorCelula3),
    calc24(W2,E2,W1,N1,S1,S2, Dist1, Distancia, ValorCelula4),
    labeling([ff],Vars),
    printLine(Vars),nl.

calc21(N1,N2,E1,S2,W1,W2,Dist1,Distancia, ValorCelula1):-
    (Dist1 #=< N1) #<=> B1,
    (Dist1 #=< N2) #<=> B2,
    (Distancia #=< E1) #<=> B3,
    (Distancia #=< S2) #<=> B4,
    (Dist1 #=< W1) #<=> B5,
    (Dist1 #=< W2) #<=> B6,
    ValorCelula1 #= B1 + B2 + B3 + B4 + B5 + B6.
calc22(N1,N2,E1,E2,S1,W2,Dist1,Distancia,ValorCelula2):-
    (Dist1 #=< N1) #<=> B1,
    (Dist1 #=< N2) #<=> B2,
    (Dist1 #=< E1) #<=> B3,
    (Dist1 #=< E2) #<=> B4,
    (Distancia #=< S1) #<=> B5,
    (Distancia #=< W2) #<=> B6,
    ValorCelula2 #= B1 + B2 + B3 + B4 + B5 + B6.
calc23(E1,E2,W1,N2,S1,S2,Dist1,Distancia,ValorCelula3):-
    (Dist1 #=< E1) #<=> B1,
    (Dist1 #=< E2) #<=> B2,
    (Distancia #=< W1) #<=> B3,
    (Distancia #=< N2) #<=> B4,
    (Dist1 #=< S1) #<=> B5,
    (Dist1 #=< S2) #<=> B6,
    ValorCelula3 #= B1 + B2 + B3 + B4 + B5 + B6.
calc24(W2,E2,W1,N1,S1,S2,Dist1,Distancia,ValorCelula4):-    
    (Dist1 #=< S1) #<=> B1,
    (Dist1 #=< S2) #<=> B2,
    (Distancia #=< N1) #<=> B3,
    (Distancia #=< E2) #<=> B4,
    (Dist1 #=< W1) #<=> B5,
    (Dist1 #=< W2) #<=> B6,
    ValorCelula4 #= B1 + B2 + B3 + B4 + B5 + B6.
%##########################################################################################################
runTestes(8):-
    statistics(runtime, [T0|_]),
    testUnitarioV8(_),
    statistics(runtime, [T1|_]),
    nl,
    T is T1 - T0,
    format('2x2 took ~16d sec.~n', [T]).
