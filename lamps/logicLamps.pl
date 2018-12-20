/**
 * FALTA A LIGACAO COM O RESTO DO PROBLEMA
 * RECEBER AS LISTAS CRIADAS ALEATORIAMENTE
 * CALCULAR O CENTRO
 * PASSAR O CENTRO PARA a mesma forma do tabuleiroTeste
*/
solvingMiddle:-
    %printMatrix(FinalTabuleiro,NewSize),
    tabuleiroTeste(TabuleiroCentralIndexes),      
    lampadasIndexes(4, LampadasIndexes),
    casasIluminadas(TabuleiroCentralIndexes, LampadasIndexes, MatrixRangeWithZeros),
    cleaningZeroRange(MatrixRangeWithZeros,MatrixRange),        
    nth1(16,MatrixRange,Elem),
    write(Elem).

%teste2010(Size,TabuleiroCentralIndexes,MatrixRange,LampadasIndexes):-
%    VarsSize is Size*4,
%    length(Vars,VarsSize),
%    domain(Vars,0,Size),
%    labeling([],Vars).


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


%myCelula((Linha-Coluna)-ValorCelula).
%tabuleiro 4x4
%myCelula(X).    X = 4-4-6 ?
%myCelula(X-Y-Z).    X = 4, Y = 4, Z = 6 ? 
%myCelula((X-Y)-Z).     X = 4, Y = 4,Z = 6 ? 
%myCelula(X-Y).     X = 4-4, Y = 6 ?
% celulasSol [  [0-1,N1],[0-2,N2],[1-3,E3],[2-3,E4],[3-2,S5],[3-1,S6],[2-0,S7],[1-0,S8] ]
%vars([N1,N2,E3,E4,S5,S6,W7,W8]).
%testUnitarioV8(Vars):-
%    VarsNumber is 4 * 2,
%    Distancia is 4,
%    length(Vars,8),
%    Tab = [1,1,2,3],

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
%%#########################################################################################################
%tabuleiroCentralIndexes(2,Tci),testUnitarioV9(2,Tci,
solvingMiddleV9:-
    %printMatrix(FinalTabuleiro,NewSize),
    Size is 2,
    tabuleiroCentralIndexes(Size,TabuleiroCentralIndexesWithValues),
    lampadasIndexes(Size, LampadasIndexes),
    casasIluminadas(TabuleiroCentralIndexesWithValues, LampadasIndexes, MatrixRangeWithZeros),
    %cleaningZeroRange(MatrixRangeWithZeros,MatrixRange),        
    %inserir aqui testeUnitarioV9
   testUnitarioV9(Vars,Size,TabuleiroCentralIndexesWithValues,MatrixRangeWithZeros),    
   % nth1(2,MatrixRangeWithZeros,Elem),
    write(Vars).

testUnitarioV9(Vars,Size,TabuleiroCentralIndexesWithValues,MatrixRangeWithZeros):-
    VarsSize #= Size*4,
    length(Vars,VarsSize),
    domain(Vars,0,Size),
%    Vars [Lista de variaveis 8], MatrixRange([ [] [] [] [] ])
    iluminati(Vars, MatrixRangeWithZeros,TabuleiroCentralIndexesWithValues),
    labeling([],Vars).

%teste iluminatiAux
testVar([N1,N2,E1,E2,S1,S2,W1,W2]).
testeDist([0-1-1, 0-2-1, 1-3-2, 2-3-0, 3-2-0, 3-1-2, 2-0-1, 1-0-1]).
testeValor((1-1)-1).

iluminatiAux( [], [], Temp,Temp).
iluminatiAux( [Var|Tvars], [(_-_)-Distancia|T], Temp,Total):-
    (Var #>= Distancia #/\ Distancia #> 0)  #<=> B,
    Temp2 #= Temp + B,
    iluminatiAux(Tvars,T, Temp2,Total).
/**
 * @param Var -lista com as oito variaveis
 * @param Lista com lampadas e range [ ... , [0-1-1,0-2-1,1-3-2,2-3-0,3-2-0,3-1-2,2-0-1,1-0-1]
*/
iluminatiGlobal(_,[],_).
iluminatiGlobal(Var, [ LampadasRange|T ] , (_-_)-ValorCelula):-
    iluminatiAux(Var,LampadasRange,0,Total),
    ValorCelula #= Total,
    iluminatiGlobal(Var, T, (_-_)-ValorCelula).

/**
 * @param Vars Lista de variaveis - 8 elem caso base
 * @param  LampadaRange|Z - Lista com as lampadas que influenciam a celula 8 elem caso base
 * Iterar sobre duas listas do mesmo tamanho: matrixRange e IndexValues
 */
iluminati(_,[],[]).
iluminati(Vars, [LampadaRange|Z],[H|T]):-
    iluminatiGlobal(Vars, LampadaRange, H), %Obtenho o valor da célula central
     %(Linha-Coluna)-Distante
     iluminati(Vars,Z,T).



%count(Val,List,Count:- c(Val,List,Count, 0).

%c(_,[],C,C).
%c(Val,[H|T],Count,Temp):-
%	Val #= H #<=> B,
%	Temp2 #= Temp + B,
%	c(Val,T,Count,Temp2).

%##########################################################################################################
/**
 * RESOLUCAO CONFIRMADA
*/
testUnitarioV8(Vars):-
    Vars = [N1,N2,E1,E2,S1,S2,W1,W2], %
    ValorCelula1 #= 1,               %
    ValorCelula2 #= 1,  %
    ValorCelula3 #= 2, %
    ValorCelula4 #= 3, %
    Distancia #= 2,     %            
    Dist1 #= 1,    %
    domain(Vars,0,2),
    calc1(N1,N2,E1,S2,W1,W2, Dist1, Distancia, ValorCelula1),
    calc2(N1,N2,E1,E2,S1,W2, Dist1, Distancia, ValorCelula2),
    calc3(E1,E2,W1,N2,S1,S2, Dist1, Distancia, ValorCelula3),
    calc4(W2,E2,W1,N1,S1,S2, Dist1, Distancia, ValorCelula4),
    labeling([],Vars).

calc1(N1,N2,E1,S2,W1,W2,Dist1,Distancia, ValorCelula1):-
    (Dist1 #=< N1) #<=> B1,
    (Dist1 #=< N2) #<=> B2,
    (Distancia #=< E1) #<=> B3,
    (Distancia #=< S2) #<=> B4,
    (Dist1 #=< W1) #<=> B5,
    (Dist1 #=< W2) #<=> B6,
    ValorCelula1 #= B1 + B2 + B3 + B4 + B5 + B6.
calc2(N1,N2,E1,E2,S1,W2,Dist1,Distancia,ValorCelula2):-
    (Dist1 #=< N1) #<=> B1,
    (Dist1 #=< N2) #<=> B2,
    (Dist1 #=< E1) #<=> B3,
    (Dist1 #=< E2) #<=> B4,
    (Distancia #=< S1) #<=> B5,
    (Distancia #=< W2) #<=> B6,
    ValorCelula2 #= B1 + B2 + B3 + B4 + B5 + B6.
calc3(E1,E2,W1,N2,S1,S2,Dist1,Distancia,ValorCelula3):-
    (Dist1 #=< E1) #<=> B1,
    (Dist1 #=< E2) #<=> B2,
    (Distancia #=< W1) #<=> B3,
    (Distancia #=< N2) #<=> B4,
    (Dist1 #=< S1) #<=> B5,
    (Dist1 #=< S2) #<=> B6,
    ValorCelula3 #= B1 + B2 + B3 + B4 + B5 + B6.
calc4(W2,E2,W1,N1,S1,S2,Dist1,Distancia,ValorCelula4):-    
    (Dist1 #=< S1) #<=> B1,
    (Dist1 #=< S2) #<=> B2,
    (Distancia #=< N1) #<=> B3,
    (Distancia #=< E2) #<=> B4,
    (Dist1 #=< W1) #<=> B5,
    (Dist1 #=< W2) #<=> B6,
    ValorCelula4 #= B1 + B2 + B3 + B4 + B5 + B6.
    