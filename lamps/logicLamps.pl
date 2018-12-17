
solvingMiddle(FinalTabuleiro,NewSize):-
    printMatrix(FinalTabuleiro,NewSize),      
    write('wellDone').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% exerc2
sumDist([X,Y|R],Dist):-
    Dist #= abs(X-Y)+ RestDist,
    sumDist([Y|R],RestDist).
sumDist([_],0).
%carteiro(+numeroDeCasas,-perc,-dist)
carteiro(N, Perc, Dist):-
    length(Perc,N),
    domain(Perc,1,N),
    all_different(Perc),
    circuit(Perc),
    sumDist(Perc,Dist),
    labeling([maximize(Dist)],Perc),
    write(Perc), nl,
    write(Dist).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% exerc1
dist([_],D,D).
dist([A,B|T],D, Temp):-
    DT #= abs(A-B),
    T2 #= Temp + DT,
    dist([B|T],D,T2).
carteiro:-
    length(Casas,10),
    domain(Casas,1,10),
    all_distinct(Casas),
    element(10, Casas, 6),
    dist(Casas,D,0),
    labeling([maximize(D),down],[D|Casas]),
    write(Casas),
    write(D).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
sampleCumulatives(Sts,Ets):-
    Sts = [ST1,ST2,ST3,ST4,ST5,ST6,ST7],
    Ets = [ET1,ET2,ET3,ET4,ET5,ET6,ET7],
    Tasks =[
        task(ST1, 16, ET1,2, 1),
        task(ST2, 6, ET2, 9, 2),
        task(ST3, 13, ET3, 3, 3),
        task(ST4, 7, ET4, 7, 4),
        task(ST5, 5, ET5, 10, 5),
        task(ST6, 18, ET6, 1, 6),
        task(ST7, 4, ET7, 11, 7)
    ],
    domain(Sts,1,30),
    maximum(End,Ets),
    cumulative(Tasks,[limit(13)]),
    labeling( [minimize(End)],Sts).
    
testeBoard([
        [1,0,0,'.'],
            [2,0,0,0],
            [3,0,0,0],
        [4,0,0,'.']
      ]).

testeLista([6,7,8,9]).

substituirValues(Lista):-
    length(Lista, Range),
    maplist(=(random(0,Range)), Lista).   

%myCelula((Linha-Coluna)-ValorCelula).
%tabuleiro 4x4
%myCelula(X).    X = 4-4-6 ?
%myCelula(X-Y-Z).    X = 4, Y = 4, Z = 6 ? 
%myCelula((X-Y)-Z).     X = 4, Y = 4,Z = 6 ? 
%myCelula(X-Y).     X = 4-4, Y = 6 ?
% celulasSol [  [0-1,N1],[0-2,N2],[1-3,E3],[2-3,E4],[3-2,S5],[3-1,S6],[2-0,S7],[1-0,S8] ]
 
%lista de pares dos indices [linha-coluna]               ((Linha-Coluna)-Range)-Celula      
tabuleiroCentral([ ((1-1)-1), 
                    ((1-2)-1), 
                    ((2-1)-3),    
                    ((2-2)-2) ]).
vars([N1,N2,E3,E4,S5,S6,W7,W8]).
solucoesWithRange([ ((0-1)-R1)-N1,((0-2)-R2)-N2, 
            ((1-3)-R3)-E3, ((2-3)-R4)-E4,
            ((3-2)-R5)-S5,((3-1)-R6)-S6,
            ((2-0)-R7)-W7,((1-0)-R8)-W8]).

posicaoSolucoes([  (0-1)-N1,(0-2)-N2, 
        (1-3)-E3, (2-3)-E4,
        (3-2)-S5,(3-1)-S6,
        (2-0)-W7,(1-0)-W8 ]).

solucao2x2([(0-1)-N1,(0-2)-N2,(1-3)-E3,(2-3)-E4,(3-2)-S5,(3-1)-S6,(2-0)-S7,(1-0)-S8]).

testUnitario(Vars):-
    Vars = [N1,E1,S1,W1],
    Tabuleiro = [1-1],
    ValorCelula is 2,
    Distancia is 1,                 
    domain(Vars,0,1),
    (Distancia #>= N1) #<=> B, %V = [0,0,0,1] ? ;
    (Distancia #>= E1) #<=> B, %V = [0,0,1,0] ? ;
    (Distancia #>= S1) #<=> B, %V = [0,1,0,0] ? ;
    (Distancia #>= W1) #<=> B, %V = [1,0,0,0] ? ;
    ValorCelula #= (N1 + E1 +S1 + W1),
    labeling([],Vars).

testUnitarioV2(Vars):-
    Vars = [N1,N2,E1,E2,S1,S2,W1,W2],
    Tabuleiro = [1-1],
    ValorCelula1 is 1,
    ValorCelula2 is 1,
    ValorCelula3 is 2,
    ValorCelula4 is 3,
    Distancia is 2,                 
    Dist1 is 1,
    domain(Vars,0,2),
    calc1(N1,N2,E1,S2,W1,W2,ValorCelula1,Dist1,Distancia),
    calc2(N1,N2,E1,E2,S1,W2,ValorCelula2,Dist1,Distancia),
    calc3(E1,E2,W1,N2,S1,S2,ValorCelula3,Dist1,Distancia),
    calc4(W2,E2,W1,N1,S1,S2,ValorCelula3,Dist1,Distancia),
    labeling([],Vars).

calc1(N1,N2,E1,S2,W1,W2,ValorCelula1,Dist1,Distancia):-
    (Dist1 #>= N1) #<=> B,
    (Dist1 #>= N2) #<=> B,
    (Distancia #>= E1) #<=> B,
    (Distancia #>= S2) #<=> B,
    (Dist1 #>= W1) #<=> B,
    (Dist1 #>= W2) #<=> B,
    ValorCelula1 #= (N1 +N2 + E1 + S2 + W1+W2).
calc2(N1,N2,E1,E2,S1,W2,ValorCelula2,Dist1,Distancia):-
    (Dist1 #>= N1) #<=> B,
    (Dist1 #>= N2) #<=> B,
    (Dist1 #>= E1) #<=> B,
    (Dist1 #>= E2) #<=> B,
    (Distancia #>= S1) #<=> B,
    (Distancia #>= W2) #<=> B,
    ValorCelula2 #= (N1 +N2 + E1 + E2 + S1 + W2).
calc3(E1,E2,W1,N2,S1,S2,ValorCelula3,Dist1,Distancia):-
    (Dist1 #>= E1) #<=> B,
    (Dist1 #>= E2) #<=> B,
    (Distancia #>= W1) #<=> B,
    (Distancia #>= N2) #<=> B,
    (Dist1 #>= S1) #<=> B,
    (Dist1 #>= S2) #<=> B,
    ValorCelula3 #= (E1 + E2 + S1 + S2 + N2 + W1).
calc4(W2,E2,W1,N1,S1,S2,ValorCelula4,Dist1,Distancia):-    
    (Dist1 #>= S1) #<=> B,
    (Dist1 #>= S2) #<=> B,
    (Distancia #>= N1) #<=> B,
    (Distancia #>= E2) #<=> B,
    (Dist1 #>= W1) #<=> B,
    (Dist1 #>= W2) #<=> B,
    ValorCelula4 #= (N1 + E2 +S1 +S2 + W1 + W2).
                    

%tabuleiroCentral(X),vars(Y),posicaoSolucoes(Z),testUni(X, Y,Z)
testUni(Tabuleiro, Vars, PosicaoSoluc):-
    domain(Vars,0,2),
    listaCasasIluminadas(Tabuleiro,PosicaoSoluc),
    labeling([],Vars).

/**
 * Auxiliar da funcao 
*/
listaCasasIluminadasAUX(_,[],[]).
listaCasasIluminadasAUX( (L-C)-ValorIluminado,[ (LinhaS-ColunaS)-SolPosicao| SolucoesListT ],[H|T]):-
    calculoDistancia(L, C, LinhaS, ColunaS, Range), 
    Range =\= 0,
    !,
    H is SolPosicao,
    listaCasasIluminadasAUX( (L-C)-ValorIluminado, SolucoesListT,T).
listaCasasIluminadasAUX( (L-C)-ValorIluminado,[ (LinhaS-ColunaS)-SolPosicao| SolucoesListT ],T):-
    listaCasasIluminadasAUX( (L-C)-ValorIluminado, SolucoesListT,T).
%N1 >= Range.
/**
 * Por cada celula do tabuleiro vou obter uma lista com as lampadas que a podem influenciar
 * tabuleiroCentral(X),posicaoSolucoes(Y),listaCasasIluminadas(X, Y, ListaInfluencias)
 */
%listaCasasIluminadas(+TabuleiroCentral, +Solucoes, -ListaRange   ((L-C)-QuartoIluminado) [(LinhaS-ColunaS)-N1|T]
listaCasasIluminadas([],_,_).
listaCasasIluminadas([H|T], SolucoesList, ListaInfluencias):-
            %length([H|T],Size),
            %length(ListaInfluencias,Size),
            listaCasasIluminadasAUX(H,SolucoesList,ListaInfluencias),
            %Lista on estao as solucoes Lista Das celulas centrais 
            listaCasasIluminadas(T, SolucoesList,ListaInfluencias ).                



/**
 * Calculo do range da iluminacao entre a Lampada e Casa iluminada
 * @param LinhaY, +ColunaY Celula da casa iluminada
 * @param +LinhaX, +ColunaX Celula da Lampada
 * @return Final Numero de casas iluminada ou na horinzontal ou vert ou diagonal
*/
%calculoDistancia(+LinhaY, +ColunaY, +LinhaX, +ColunaX, -Final)
calculoDistancia(LinhaY, ColunaY, LinhaX, ColunaX, Final):-
        ( Lin is LinhaY - LinhaX,
          Dist1 is ColunaY - ColunaX,
          Lin =:= 0,
          Final is abs(Dist1) )
          ;
        (   Col is ColunaY - ColunaX,
            Dist2 is LinhaY - LinhaX, 
            Col =:= 0,
            Final is abs(Dist2) )
            ;
        (   Dist1 is abs(LinhaY - LinhaX),
            Dist2 is abs(ColunaY - ColunaX),
            Dist1  =:= Dist2,
            Final is Dist1
        ).





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
    
    
    