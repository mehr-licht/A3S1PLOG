
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


tabuleiroTeste([
    (1-1)-4,(1-2)-6,(1-3)-6,(1-4)-5,
    (2-1)-5,(2-2)-2,(2-3)-6,(2-4)-4,
    (3-1)-4,(3-2)-6,(3-3)-6,(3-4)-6,
    (4-1)-4,(4-2)-6,(4-3)-6,(4-4)-4]).


% List of given numbers already on the board (Linha,Coluna, Number)
tabuleiroCentralIndexes(2,Lista):-
    Lista = [(1-1)-1,(1-2)-1,(2-1)-2,(2-2)-3].
tabuleiroCentralIndexes(3,Lista):-
    Lista = [(1-1),(1-2),(1-3),(2-1),(2-2),(2,3),(3-1),(3-2),(3-3)].
tabuleiroCentralIndexes(4,Lista):-
    Lista = [(1-1),(1-2),(1-3),(1-4),(2-1),(2-2),(2-3),(2-4),(3-1),(3-2),(3-3),(3-4),(4-1),(4-2),(4-3),(4-4)].
tabuleiroCentralIndexes(5,Lista):-
    Lista = [(1-1),(1-2),(1-3),(1-4),(1-5),
             (2-1),(2-2),(2-3),(2-4),(2-5),
             (3-1),(3-2),(3-3),(3-4),(3-5),
             (4-1),(4-2),(4-3),(4-4),(4-5),
             (5-1),(5-2),(5-3),(5-4),(5-5)].
tabuleiroCentralIndexes(6,Lista):-
    Lista = [(1-1),(1-2),(1-3),(1-4),(1-5),
             (2-1),(2-2),(2-3),(2-4),(2-5),
             (3-1),(3-2),(3-3),(3-4),(3-5),
             (4-1),(4-2),(4-3),(4-4),(4-5),
             (5-1),(5-2),(5-3),(5-4),(5-5)].
tabuleiroCentralIndexes(7,Lista):-
    Lista = [(1-1),(1-2),(1-3),(2-1),(2-2),(2,3),(3-1),(3-2),(3-3)].
tabuleiroCentralIndexes(8,Lista):-
    Lista = [(1-1),(1-2),(1-3),(2-1),(2-2),(2,3),(3-1),(3-2),(3-3)].
tabuleiroCentralIndexes(9,Lista):-
    Lista = [(1-1),(1-2),(1-3),(2-1),(2-2),(2,3),(3-1),(3-2),(3-3)].
% Linha Col N1    N2    E1    E2    S1   S2     W1    W2
% Define o modo de como vao aparecer as solucoes
lampadasIndexes(2, Lista):-
    Lista = [(0-1),(0-2),
             (1-3),(2-3),
             (3-2),(3-1),
             (2-0),(1-0)].

lampadasIndexes(3, Lista):-
    Lista = [(0-1),(0-2),(0-3),
             (1-4),(2-4),(3-4), %coluna 3+1
             (4-3),(4-2),(4-1), %linha size+1
             (3-0),(2-0),(1-0)].

lampadasIndexes(4, Lista):-
    Lista = [(0-1),(0-2),(0-3),(0-4),
             (1-5),(2-5),(3-5),(4-5),
             (5-4),(5-3),(5-2),(5-1),
             (4-0),(3-0),(2-0),(1-0)].
            

/**
 * As an example of a constraint that uses reification,
 * consider exactly(X,L,N) which is true if X occurs exactly N times in the list L.

exactly(_, [], 0).
exactly(X, [Y|L], N) :-
    X #=< Y #<=> B,
    N #= M+B,
    exactly(X, L, M).

substituirValues(Lista):-
    length(Lista, Range),
    maplist(=(random(0,Range)), Lista).   
*/

/** RESOLUCAO CONFIRMADA
 * Conclusoes deste teste unitario: variavel igual vai influenciar o resultado de todas as equivalencia. 
 * Este mesmo resultado eh influenciado consoante se usa < ou >
 * Note-se que se B na equivalencia so resulta se X1 #=<Distancia
 * Se nas equivalencias tiver BX entao so resulta se X1 #>=Distancia
*/
testUnitario(Vars):-
    Vars = [N1,E1,S1,W1],
    ValorCelula #= 2, %mudanca desta variavel provoca alteracoes em Vars correctas
    Distancia #= 1,                 
    domain(Vars,0,1),
    (N1 #>= Distancia) #<=> B1, %V = [0,0,0,1] ? ;
    (E1 #>= Distancia) #<=> B2, %V = [0,0,1,0] ? ;
    (S1 #>= Distancia) #<=> B3, %V = [0,1,0,0] ? ;
    (W1 #>= Distancia) #<=> B4, %V = [1,0,0,0] ? ;
    ValorCelula #= (B1 + B2 + B3 + B4),
    labeling([],Vars).

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
