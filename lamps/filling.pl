%filling(SizeInput, [[3,0,3,2],[3,0,1,3],[2,4,3,4],[2,3,1,0]])
%SizeInput,SolutionsList
filling:-
    Size is 16 mod 4,
    write(Size).
    %makeBoard(+Size,-Tabuleiro, -Size),
    %makeBoard(Size,Tabuleiro, Size),





%SolverFilling(+Vars, +SolutionsList)
solverFilling(Vars,SolutionsList,  Size,TabuleiroCentralIndexesWithValues,MatrixRangeWithZeros):-
    flatten(SolutionsList, NewL),
    length(NewL, TotalSize),    
    VarsSize #= TotalSize mod 4,
    length(Vars,VarsSize),
    domain(Vars,0,Size),
    %    Vars [Lista de variaveis 8], MatrixRange([ [] [] [] [] ])
    iluminatiGlobal(Vars, MatrixRangeWithZeros,TabuleiroCentralIndexesWithValues),
    labeling([ff],Vars).



/*
*
*/
iluminatiCentralAux( [], [], Temp,Temp).
iluminatiCentralAux( [Var|Tvars], [(_-_)-Distancia|T], Temp,Total):-
    (Var #>= Distancia #/\ Distancia #> 0)  #<=> B,
    Temp2 #= Temp + B,
    iluminatiAux(Tvars,T, Temp2,Total).
/**
 * @param Vars Lista de variaveis - 8 elem caso base
 * @param LampadaRange|Z - Lista com as lampadas que influenciam a celula 8 elem caso base
 * @param Matix com as distancias de cada celula para todas as lampadas 
 */
iluminatiCentralGlobal(_,[],[]).
iluminatiCentralGlobal(Vars, [LampadaRange|Z],[(_-_)-ValorCelula| T]):-
    iluminatiAux(Vars, LampadaRange,0,Total), %Obtenho o valor da célula central
    ValorCelula #= Total,
    iluminatiGlobal(Vars,Z,T).

    