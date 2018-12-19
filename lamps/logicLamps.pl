/**
 * 
*/
solvingMiddle(FinalTabuleiro,NewSize):-
    printMatrix(FinalTabuleiro,NewSize),      
    write('wellDone').

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


substituirValues(Lista):-
    length(Lista, Range),
    maplist(=(random(0,Range)), Lista).   

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
*/
casasIluminadas([],_,[]).
casasIluminadas([H|T], ListLamp, [ListaInfluencias|NewLista]):-
            addRange(H, ListLamp, ListaInfluencias),
            casasIluminadas(T, ListLamp,NewLista ).                

% List of given numbers already on the board (Linha,Coluna, Number)
tabuleiroCentral([(1-1)-1,(1-2)-1,(2-1)-3,(2-2)-2]).
% Linha Col N1    N2    E1    E2    S1   S2     W1    W2
lampadas([(0-1),(0-2),(1-3),(2-3),(3-2),(3-1),(2-0),(1-0)   ]).

%myCelula((Linha-Coluna)-ValorCelula).
%tabuleiro 4x4
%myCelula(X).    X = 4-4-6 ?
%myCelula(X-Y-Z).    X = 4, Y = 4, Z = 6 ? 
%myCelula((X-Y)-Z).     X = 4, Y = 4,Z = 6 ? 
%myCelula(X-Y).     X = 4-4, Y = 6 ?
% celulasSol [  [0-1,N1],[0-2,N2],[1-3,E3],[2-3,E4],[3-2,S5],[3-1,S6],[2-0,S7],[1-0,S8] ]
%vars([N1,N2,E3,E4,S5,S6,W7,W8]).

/**
 * As an example of a constraint that uses reification,
 * consider exactly(X,L,N) which is true if X occurs exactly N times in the list L.
*/
exactly(_, [], 0).
exactly(X, [Y|L], N) :-
    X #= Y #<=> B,
    N #= M+B,
    exactly(X, L, M).



testUnitarioV2(Vars):-
    Vars = [N1,E1,S1,W1],
    ValorCelula #= 2,
    Distancia #= 1,                 
    domain(Vars,0,2),
    (Distancia #>= N1) #<=> B, %V = [0,0,0,1] ? ;
    (Distancia #>= E1) #<=> B, %V = [0,0,1,0] ? ;
    (Distancia #>= S1) #<=> B, %V = [0,1,0,0] ? ;
    (Distancia #>= W1) #<=> B, %V = [1,0,0,0] ? ;
    ValorCelula #= (N1 + E1 +S1 + W1),
    labeling([],Vars).



testUnitario(Vars):-
    Vars = [N1,E1,S1,W1],
 %   Tabuleiro = [1-1],
    ValorCelula #= 2,
    Distancia #= 1,                 
    domain(Vars,0,1),
    (Distancia #>= N1) #<=> B, %V = [0,0,0,1] ? ;
    (Distancia #>= E1) #<=> B, %V = [0,0,1,0] ? ;
    (Distancia #>= S1) #<=> B, %V = [0,1,0,0] ? ;
    (Distancia #>= W1) #<=> B, %V = [1,0,0,0] ? ;
    ValorCelula #= (N1 + E1 +S1 + W1),
    labeling([],Vars).

testUnitarioV8(Vars):-
    Vars = [N1,N2,E1,E2,S1,S2,W1,W2],
 %   Tabuleiro = [1-1],
    ValorCelula1 #= 1,
    ValorCelula2 #= 1,
 %   ValorCelula3 #= 2,
 %   ValorCelula4 #= 3,
    Distancia #= 2,                 
    Dist1 #= 1,
    domain(Vars,0,2),
    
    ValorCelula1 #= (N1 + N2 + E1 + S2 + W1 + W2),
    ValorCelula2 #= (N1 + N2 + E1 + E2 + S1 + W2),
   % ValorCelula3 #= (E1 + E2 + S1 + S2 + N2 + W1),
   % ValorCelula4 #= (N1 + E2 + S1 + S2 + W1 + W2),
    (Dist1 #>= N1) #<=> B,
    (Dist1 #>= N2) #<=> B,
    (Distancia #>= E1) #<=> B,
    (Distancia #>= E2) #<=> B,
    (Distancia #>= S1) #<=> B,
    (Distancia #>= S2) #<=> B,
    (Dist1 #>= W1) #<=> B,
    (Dist1 #>= W2) #<=> B,

   % calc1(N1,N2,E1,S2,W1,W2,Dist1,Distancia),
   % calc2(N1,N2,E1,E2,S1,W2,Dist1,Distancia),
   % calc3(E1,E2,W1,N2,S1,S2,Dist1,Distancia),
   % calc4(W2,E2,W1,N1,S1,S2,Dist1,Distancia),
    labeling([],Vars).

calc1(N1,N2,E1,S2,W1,W2,Dist1,Distancia):-
    (Dist1 #>= N1) #<=> B1,
    (Dist1 #>= N2) #<=> B2,
    (Distancia #>= E1) #<=> B3,
    (Distancia #>= S2) #<=> B4,
    (Dist1 #>= W1) #<=> B5,
    (Dist1 #>= W2) #<=> B6.
  %  ValorCelula1 #= (N1 +N2 + E1 + S2 + W1+W2).
calc2(N1,N2,E1,E2,S1,W2,Dist1,Distancia):-
    (Dist1 #>= N1) #<=> B1,
    (Dist1 #>= N2) #<=> B2,
    (Dist1 #>= E1) #<=> B3,
    (Dist1 #>= E2) #<=> B4,
    (Distancia #>= S1) #<=> B5,
    (Distancia #>= W2) #<=> B6.
 %   ValorCelula2 #= (N1 +N2 + E1 + E2 + S1 + W2).
calc3(E1,E2,W1,N2,S1,S2,Dist1,Distancia):-
    (Dist1 #>= E1) #<=> B1,
    (Dist1 #>= E2) #<=> B2,
    (Distancia #>= W1) #<=> B3,
    (Distancia #>= N2) #<=> B4,
    (Dist1 #>= S1) #<=> B5,
    (Dist1 #>= S2) #<=> B6.
  %  ValorCelula3 #= (E1 + E2 + S1 + S2 + N2 + W1).
calc4(W2,E2,W1,N1,S1,S2,Dist1,Distancia):-    
    (Dist1 #>= S1) #<=> B1,
    (Dist1 #>= S2) #<=> B2,
    (Distancia #>= N1) #<=> B3,
    (Distancia #>= E2) #<=> B4,
    (Dist1 #>= W1) #<=> B5,
    (Dist1 #>= W2) #<=> B6.
  %  ValorCelula4 #= (N1 + E2 +S1 +S2 + W1 + W2).
                    

%tabuleiroCentral(X),vars(Y),posicaoSolucoes(Z),testUni(X, Y,Z)
testUni(Tabuleiro, Vars, PosicaoSoluc):-
    domain(Vars,0,2),
    listaCasasIluminadas(Tabuleiro,PosicaoSoluc),
    labeling([],Vars).

%quad([_,_,_,_],0).
%quad([A,B,C,D | T],Count):-
%    (A#=2#/\B#=3#/\C#=3#/\D#=4)#<=>Bin,
%    quad([A,B,C,D | T],C2),Count #=C2+Bin. 

%countNew(Val,List,Count,C):-
%    countAUX(Val, List,Count,0).

%countAUX(_,[],C,C).
%countAUX(Val,[H|T],Count,Temp):-
%    Val #=#<=> B_,
%    Temp2 #= Temp +B,
%    countAUX(Val,T,Count,Temp2).
    
    
    