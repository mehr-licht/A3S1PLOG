
solvingMiddle(FinalTabuleiro,NewSize):-
    printMatrix(FinalTabuleiro,NewSize),      
    write('wellDone').







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


%tabuleiro 4x4
%recebo o tabuleiro
% celulasSol [  [0-1,S1],[0-2,S2],[1-3,S3],[2-3,S4],[3-2,S5],[3-1,S6],[2-0,S7],[1-0,S8] ]
% TabuleiroCentral = [ [1-1,1],[1-2,1],[2-1,3],[2-2,2] ]
testUni(Vars):-
    Tabuleiro = [1-1,1-2,2-1,2-2], %lista de pares dos indices [linha-coluna]
    Vars = [S1,S2,S3,S4,S5,S6,S7,S8,S9],
    domain(Vars,0,2),

    labeling([],Vars).





%quad([_,_,_,_],0).
%quad([A,B,C,D | T],Count):-
%    (A#=2#/\B#=3#/\C#=3#/\D#=4)#<=>Bin,
%    quad([A,B,C,D | T],C2),Count #=C2+Bin. 
%countNew(Val,List,Count,C):-
%    countAux(Val, List,Count,0).
%countAux(_,[],C,C).
%countAux(Val,[H|T],Count,Temp):-
%    Val #=#<=> B_,
%    Temp2 #= Temp +B,
%    countAux(Val,T,Count,Temp2).
    
    
    