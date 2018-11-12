/**---------------------------------------------------------------
* funcoes de complemento - Antes da descoberta de uma coisa chamafa library(lists)
* caso base o Value vai se juntar ah nova lista
*/
replaceInList([_H|T], 0, Value, [Value|T]).
% funcao de chamada recursiva para percorrer a lsita
replaceInList([H|T], Index, Value, [H|TNew]) :-
        Index > 0,
        Index1 is Index - 1,
        replaceInList(T, Index1, Value, TNew).

/*----------------------------------------------------------------
* caso base Substituir um valor na matrix em complemento com as anteriores
* caso base
*/
replaceInMatrix([H|T], 0, Column,Value, [HNew|T]) :-
        replaceInList(H, Column, Value, HNew).
% percorrer a lista de listas
replaceInMatrix([H|T], Row, Column, Value, [H|TNew]) :-
        Row > 0,
        Row1 is Row - 1,
        replaceInMatrix(T, Row1, Column, Value, TNew).


/**- Formato Idade Mehdia
*caso base
*/
getValueFromList([H|_T], 0, Value) :-
        Value = H.
%funcao recursiva para obter o valor na lista
getValueFromList([_H|T], Index, Value) :-
        Index > 0,
        Index1 is Index - 1,
        getValueFromList(T, Index1, Value).


/*----------------------------------------------------------------
* Uma matrix eh uma lista de listas
* Percorre uma linha em primeiro lugar, e depois com o getValueFrom List retorna o Valor
* Caso base quando estamos na ultima linha
*/
getValueFromMatrix([H|_T], 0, Column, Value) :-
        getValueFromList(H, Column, Value).
%Percorre cada linha - funcao recursiva que em cada lista chama o getValueFromLis
getValueFromMatrix([_H|T], Row, Column, Value) :-
        Row > 0,
        Row1 is Row - 1,
        getValueFromMatrix(T, Row1, Column, Value).
