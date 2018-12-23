%%#########################################################################################################
solvingMiddleV9(Size,TabuleiroCentralIndexesWithValues, LampadasIndexes):-
    casasIluminadas(TabuleiroCentralIndexesWithValues, LampadasIndexes, MatrixRangeWithZeros),
    write('Solving Puzzle... '),nl,
    statistics(runtime, [T0|_]),
    testUnitarioV9(Vars,Size,TabuleiroCentralIndexesWithValues,MatrixRangeWithZeros),
    %################################### Statistics
    statistics(runtime, [T1|_]),
    fd_statistics(resumptions, Resump),
    fd_statistics(entailments, Entail),    
    fd_statistics(prunings, Prun),
    fd_statistics(backtracks, Back),
    fd_statistics(constraints, Const),
    %#################################   Statistics
    write('Solution: '),
    write(Vars),nl,
    write('Diferent solution from the previous one, only means there is more than one solution'),nl,
    nl,
    T is T1 - T0,
    Tsec is T//1000,
    write('Time solving: '),
    write(Tsec), write( 'seconds'), nl,
    write('Resumptions:  '), write(Resump), write(' >>The number of times a constraint was resumed'), nl, 
    write('Entailments:  '), write(Entail), write(' >>The number of times a (dis)entailment was detected by a constraint'), nl,
    write('Prunings:     '), write(Prun), write('  >>The number of times a domain was pruned'), nl, 
    write('Backtracks:   '), write(Back), write('  >>The number of times a contradiction was found by a domain being wiped out, or by a global constraint signalling failure'), nl, 
    write('Constraints:  '), write(Const), write('  >>The number of constraints created'), nl. 
   
   % format('took ~16d sec.~n', [T]),nl,
   % write('Finding all possibe solutions: '),nl,
   % findall(Vars,testUnitarioV9(Vars,Size,TabuleiroCentralIndexesWithValues,MatrixRangeWithZeros), FindallLista),
    %write(FindallLista).

%%%%%%%%%%%%%%%%%  ########################   End #########################################
%%%
testUnitarioV9(Vars,Size,TabuleiroCentralIndexesWithValues,MatrixRangeWithZeros):-
    VarsSize #= Size*4,
    length(Vars,VarsSize),
    domain(Vars,0,Size),
%    Vars [Lista de variaveis 8], MatrixRange([ [] [] [] [] ])
    iluminatiGlobal(Vars, MatrixRangeWithZeros,TabuleiroCentralIndexesWithValues),
    labeling([max, bisect, up],Vars).


iluminatiAux( [], [], Temp,Temp).
iluminatiAux( [Var|Tvars], [(_-_)-Distancia|T], Temp,Total):-
    (Var #>= Distancia #/\ Distancia #> 0)  #<=> B,
    Temp2 #= Temp + B,
    iluminatiAux(Tvars,T, Temp2,Total).
/**
 * @param Vars Lista de variaveis - 8 elem caso base
 * @param LampadaRange|Z - Lista com as lampadas que influenciam a celula 8 elem caso base
 * @param Matix com as distancias de cada celula para todas as lampadas 
 */
iluminatiGlobal(_,[],[]).
iluminatiGlobal(Vars, [LampadaRange|Z],[(_-_)-ValorCelula| T]):-
    iluminatiAux(Vars, LampadaRange,0,Total), %Obtenho o valor da célula central
    ValorCelula #= Total,
    iluminatiGlobal(Vars,Z,T).
%##################################################################################### Utilities
/**
 * Calculo da distancia da iluminacao entre a Lampada e Casa iluminada
 * @param LinhaY, +ColunaY Celula da casa iluminada
 * @param +LinhaX, +ColunaX Celula da Lampada
 * @return Final Numero de casas iluminada ou na horinzontal ou vert ou diagonal
*/
%calculoDistancia(+LinhaY, +ColunaY, +LinhaX, +ColunaX, -Final)
calculoDistancia(LinhaY, ColunaY, LinhaX, ColunaX, Final):-
    Lin is abs(LinhaY - LinhaX),
    Lin =:= 0,
    !,
    Dist1 is ColunaY - ColunaX,
    Final is abs(Dist1).  
calculoDistancia(LinhaY, ColunaY, LinhaX, ColunaX, Final):-      
    Col is abs(ColunaY - ColunaX),
    Col =:= 0,
    !,     
    Dist2 is LinhaY - LinhaX,
    Final is abs(Dist2).
calculoDistancia(LinhaY, ColunaY, LinhaX, ColunaX, Final):-      
    Dist1 is abs(LinhaY - LinhaX),
    Dist2 is abs(ColunaY - ColunaX),    
    Dist1  =:= Dist2,
    !,
    Final is Dist1.
calculoDistancia(LinhaY, ColunaY, LinhaX, ColunaX, Final):- 
    Dist1 is abs(LinhaY - LinhaX),
    Dist2 is abs(ColunaY - ColunaX),
    Dist1  \== Dist2,
    Final is 0.

/**
 * Eliminar elementos ParIndexes que tem como RANGE zero
 * @param [H|T] ListaRange da funcao casasIluminadas sob a forma (linha-coluna)-range
 * @param [Lista|New] Devolve uma lista de listas em que cada elemento corresponde a uma celula central
 * conteudo as lampadas que a iluminam e o range.
*/
cleaningAuxZeroRange([],[]).
cleaningAuxZeroRange([ParIndexes-Range|T],[ParIndexes-Range|Lista]):-
    Range =\= 0,
    !,
    cleaningAuxZeroRange(T,Lista).
cleaningAuxZeroRange([_-_|T],Lista):-cleaningAuxZeroRange(T,Lista).

cleaningZeroRange([],[]).
cleaningZeroRange([H|T],[Lista|New]):-
        cleaningAuxZeroRange(H,Lista),
        cleaningZeroRange(T,New).

/** Funcao de auxilio a casasIluminadas
 * @param (Lin-Col)-Vl Celula central do tabuleiro (Indice_LINHA-Indice_COLUNA)-ValorInicial
 * @param [(Lin2-Col2)| T ] Lista dos indexes das lampadas (LINHAS-COLUNAS)
 * @param [ ((Lin2-Col2)- Range) | NewLista]  Constitui a nova lista a ser devolvida
 * @return [0-1-1,0-2-1,1-3-2,2-3-0,3-2-0,3-1-2,2-0-1,1-0-1]
 * Por cada elemento LINHA-COLUNA-RANGE
*/
addRange(_, [],[]).
addRange((Lin-Col)-Vl, [(Lin2-Col2)| T ],[ ((Lin2-Col2)- Range) | NewLista]):-
    calculoDistancia(Lin, Col, Lin2, Col2, Range),
    addRange((Lin-Col)-Vl, T, NewLista).
/**
 * @param [H|T] Lista de pares constituidos por (LINHA-COLUNA)-VALORinicialDaCelula
 * @param ListLamp Lista de pares, correspondente ah posicao das lampadas (LINHA-COLUNA)
 * @return Devolve uma Lista de Listas em que cada elemento corresponde a UMA posicao da célula central
 * e o elemento eh uma lista com a lampada e a respectiva distancia entre essa celula para todas as lampadas
 *
 * listaIluminadas(+TabuleiroCentral, +Lampadas, -ListaRange -> Listas de Listas Ordenacao atraves do tab  (L-C)-Range 
 * Uso consola lampadasIndexes(4, Lista1),tabuleiroTeste(4,Lista2),casasIluminadas(Lista2,Lista1, NewLista) nht1 (1,NewLista,Elem)
 * Ha medida que aumentamos a dimensao
*/
casasIluminadas([],_,[]).
casasIluminadas([H|T], ListLamp, [ListaInfluencias|NewLista]):-
            addRange(H, ListLamp, ListaInfluencias),
            casasIluminadas(T, ListLamp,NewLista ).                
