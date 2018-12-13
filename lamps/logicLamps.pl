
solvingMiddle(FinalTabuleiro,NewSize):-
    printMatrix(FinalTabuleiro,NewSize),      
    write('wellDone').







testeBoard([
        [1,0,0,'.'],
            [2,0,0,0],
            [3,0,0,0],
        [4,0,0,'.']
      ]).



    
%Size = 4
%fillTop(_, _, _, 1).
%fillTop(Tabuleiro, Size, NewTabuleiro, Index):-
%    getList(Tabuleiro, 0, Lista),
%    substituirValues(Lista,NewLista).

testeLista([6,7,8,9]).

substituirValues(Lista):-
    length(Lista, Range),
    maplist(=(random(0,Range)), Lista).   


   % random(0, Range, NewNumber),
   % replaceInList(Lista, Index, Value, NewLista)

    %for random list
 %  maplist(random(0,10), Zs)


 %   random(0, Size , Lampada),
 %   replaceInMatrix(Tabuleiro, 0, Index, Lampada, NewTabuleiro),
 %   NewIndex is Index-1,
 %   fillTop(TabuleiroDois, Size, NewTabuleiro, NewIndex).
    
%fillFutureSolutions(Tabuleiro, Size, NewTabuleiro):-
%    Index is Size -1.
  %  fillTop(Tabuleiro, Size, NewTabuleiro, Index).


    
%fillFutureSolutionsLeft(Tabuleiro, Size,NewTabuleiro):-
%    Index is Size -1,
%    random(0, Index , R).
   % 0,1  0,NewSize-1 top
   % 1,0 2,0 esquerda
   % 1,3 2,3 direita
   % NewSize-1,1 NewSize-1,2 buttom
 
