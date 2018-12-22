
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Testes
%filling(SizeInput, [[3,0,3,2],[3,0,1,3],[2,4,3,4],[2,3,1,0]])
%SizeInput,SolutionsList
solutionsList([[3,0,3,2],[3,0,1,3],[2,4,3,4],[2,3,1,0]]).
testeSol([[2,1,2,2],[2,2,2,2]]).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%filling(Tabuleiro, SolutionsList, SizeInput)

filling(Tabuleiro,SolutionsList, SizeInput):-
    flatten2(SolutionsList, NewL),
    makeIndexes(SizeInput, ListaLinha, ListaColuna),
    makeIndexesBoard(ListaLinha, ListaColuna, TabuleiroPares),
    makeIndexesLampadas(SizeInput, ListaLampadas),
            %printLine(TabuleiroPares),             RESULT>> [1-1,1-2] | [2-1,2-2] | 
            %nl,
    joinLampadasIndexes(ListaLampadas,NewL, LampadasEIndexes),
            %printLine(LampadasEIndexes), RESULT >> 0-1-2 | 0-2-1 | 1-3-2 | 2-3-2 | 3-2-2 | 3-1-2 | 2-0-2 | 1-0-2 | 
            %printLine(TabuleiroPares),nl, nl,
    flatten2(TabuleiroPares, TabCelulas),
            %printLine(TabCelulas),nl,nl,  RESULT>> 1-1 | 1-2 | 2-1 | 2-2 |
    casasIluminadasMiddle(TabCelulas, LampadasEIndexes, MatrixRangeWithZeros),
    iluminacao(MatrixRangeWithZeros,Centro),
            %printLine(Centro),nl,nl       RESULT >> 6 | 6 | 6 | 5 
    prepar(TabCelulas,Centro,TabuleiroCentralIndexes),
            %printLine(TabuleiroCentralIndexes),nl.nl     RESULT >>  1-1-6 | 1-2-6 | 2-1-6 | 2-2-5 |
    
    Size is SizeInput +2,
    replaceIndexMatrix(TabuleiroCentralIndexes,Tabuleiro,FinalTabuleiro),
    nl,nl, write('Tabuleiro preenchido com centro: '), nl,nl,
    printMatrix(FinalTabuleiro, Size),nl,nl,
    solvingMiddleV9(SizeInput,TabuleiroCentralIndexes,ListaLampadas ).

%PARA O SOLVER ENVIO:
%    ListaLampadas => LampadasIndexes
%    TabuleiroCentralIndexes
replaceIndexMatrix([],T,T).
replaceIndexMatrix([(L-C)-Value|T], Tabuleiro, FinalTabuleiro):-
    replaceInMatrix(Tabuleiro, L, C, Value, InterTab),
    replaceIndexMatrix(T, InterTab,FinalTabuleiro).



%%######################################################################################
prepar([],[],[]).
prepar([H|T],[C|B],[(H-C)|J]):-
    prepar(T,B,J).
%########################################################################################  Solver Centro
%%%Devolve o numero de lampadas que incluenciam a casa
checkDistanceAndValues([],[]).
checkDistanceAndValues([(((L-C)-VLamp)-Distancia) | T] ,[(((L-C)-VLamp)-Distancia)|Tail]):-
    VLamp >= Distancia, 
    Distancia > 0,
    !,
    checkDistanceAndValues(T,Tail).
checkDistanceAndValues([_ | T ] , Tail):-
    checkDistanceAndValues(T,Tail).


iluminacao([],[]).
iluminacao([H|T],[Elem | Tail]):-
    checkDistanceAndValues(H, FilteresList),
    length(FilteresList, Elem),
    iluminacao(T,Tail).

%###################################################################################### Calc do range
/** Funcao de auxilio a casasIluminadas
 * @param A Celula central do tabuleiro (Indice_LINHA-Indice_COLUNA)
 * @param [(Lin2-Col2)-Vl| T ] Lista dos indexes das lampadas (LINHAS-COLUNAS) -Valor da Lampada
 * @param [ ((Lin2-Col2)-ValorLamapda Range) | NewLista]  Constitui a nova lista a ser devolvida
 * @return 
 * Por cada elemento LINHA-COLUNA-RANGE
*/

addRangeMiddle(_, [],[]).
addRangeMiddle((Lin-Col), [((Lin2-Col2)-Vl)| T ],[ (((Lin2-Col2)-Vl)-Range) | NewLista]):-
    calculoDistancia(Lin, Col, Lin2, Col2, Range),
    addRangeMiddle((Lin-Col), T, NewLista).
/**
 * @param [H|T] Lista de pares constituidos por (LINHA-COLUNA)
 * @param ListLamp Lista de pares, correspondente ah posicao das lampadas (LINHA-COLUNA)-VALOR LAMPADA
 * @return Devolve uma Lista de Listas em que cada elemento corresponde a UMA posicao da célula central
 * e o elemento eh uma lista com a lampada, Valor da Lampad
 * e a respectiva distancia entre essa celula para todas as lampadas
 * listaIluminadas(+TabuleiroCentral, +Lampadas, -ListaRange -> Listas de Listas Ordenacao atraves do tab  (L-C)-Range 
 * Uso consola lampadasIndexes(4, Lista1),tabuleiroTeste(4,Lista2),casasIluminadas(Lista2,Lista1, NewLista) nht1 (1,NewLista,Elem)
 * Ha medida que aumentamos a dimensao
*/
casasIluminadasMiddle([],_,[]).
casasIluminadasMiddle([H|T], ListLamp, [ListaInfluencias|NewLista]):-
            addRangeMiddle(H, ListLamp, ListaInfluencias),
            casasIluminadasMiddle(T, ListLamp,NewLista ).                

%#############################################################################################
%#############################################################################################

                    %[(X-Y),..,]           %[...]
joinLampadasIndexes([],[],[]).                    
joinLampadasIndexes([Hlampadas|Tlampadas],[H|T], [(Hlampadas-H)|TlampIndexes]):-
    joinLampadasIndexes(Tlampadas,T, TlampIndexes).


%#########################################################################################  MAKE INDEX LAMPADAS
makeLampAux([],_,[]).
makeLampAux([H|Z], Col, [(H-Col)|T]):-
    makeLampAux(Z, Col, T).

makeWestLamp(Size, ListaLeft):-
    makeIndexes(Size,ListaLinha,_),
    makeLampAux(ListaLinha, 0, Z),
    reverse(Z,ListaLeft).

makeSouthLamp(Size, ListaButtom):-
    NewSize is Size + 1,
    makeIndexes(Size,_,ListaColunas),
    makeLine(NewSize, ListaColunas, A),
    reverse(A,ListaButtom).
    
makeEastLamp(Size, ListaRight):-
    NewSize is Size + 1,
    makeIndexes(Size,ListaLinha,_),
    makeLampAux(ListaLinha, NewSize, ListaRight).

makeNorthLamp(Size,ListaTop):-
    makeIndexes(Size,_,ListaColunas),
    makeLine(0, ListaColunas, ListaTop).

%makeIndexesLampadas(4, Lista):-
%    Lista = [(0-1),(0-2),(0-3),(0-4),
%             (1-5),(2-5),(3-5),(4-5),
%             (5-4),(5-3),(5-2),(5-1),
%             (4-0),(3-0),(2-0),(1-0)].
%TESTED makeIndexesLampadas(+Size, -Lista)
makeIndexesLampadas(Size, Lista):-
   makeNorthLamp(Size,ListaTop),
   makeEastLamp(Size,ListaRight),
   append(ListaTop,ListaRight, Z),
   makeSouthLamp(Size, ListaButtom),
   append(Z,ListaButtom, X),
   makeWestLamp(Size, ListaLeft),
   append(X,ListaLeft, Lista).
   
/*
* Faz uma lista de indexes para o tabuleiroCentral
*/
makeLine(_,[],[]).
makeLine(L,[Hcol|Tcol],[(L-Hcol)|TaLin]):-
      makeLine(L, Tcol,TaLin).  
makeIndexesBoard([], _,[]).
makeIndexesBoard([L|T], ListaColuna,[ TaLin| Ttablin ]):-
        makeLine(L,ListaColuna,TaLin),
        makeIndexesBoard(T, ListaColuna, Ttablin).    
/*
* Faz duas listas sob a form 1,2,3,4,5 LOL
*/
makeIndexes(Size, ListaLinha, ListaColuna):-
    numlist(1,Size,ListaLinha),
    numlist(1,Size,ListaColuna).
%###################################################################################################

    