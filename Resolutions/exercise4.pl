mylist([1,2,3,4,5,6,7,8,9]).
mylistB([1,2,3,1,2,3,1,2,3]).
%---------------------------------------------------------------
% funcoes de complemento
% caso base o Value vai se juntar ah nova lista
replaceInList([_H|T], 0, Value, [Value|T]).
% funcao de chamada recursiva para percorrer a lsita
replaceInList([H|T], Index, Value, [H|TNew]) :-
        Index > 0,
        Index1 is Index - 1,
        replaceInList(T, Index1, Value, TNew).


replaceInListv1([_H|T], ValorASubstituir, NewValue, [NewValue|T]):-   _H = ValorASubstituir.  
% funcao de chamada recursiva para percorrer a lsita
replaceInListv1([H|T], ValorASubstituir, NewValue, [H|TNew]) :-
        %Index > 0,
        %Index1 is Index - 1,
        replaceInListv1(T, ValorASubstituir, NewValue, TNew).
