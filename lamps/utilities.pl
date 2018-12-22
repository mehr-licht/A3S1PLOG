

flatten2([], []) :- !.
flatten2([L|Ls], FlatL) :-
    !,
    flatten2(L, NewL),
    flatten2(Ls, NewLs),
    append(NewL, NewLs, FlatL).
flatten2(L, [L]).

%########################################################################## GETS
/**
 * Devolve uma lista
*/
getList([H|_T], 0, H).
getList([_H|T], Index, Lista):-
    Index1 is Index - 1,
    getList(T, Index1, Lista).        
%Same thing as the previous
getLineFromMatrix(Tabuleiro,Index, Line):-
    nth0(Index,Tabuleiro, Line).

/**
 * Devolve todos os elementos da mesma coluna da matrix
 * Index - Size do tabuleiro, comprimento da lista -> Se tab 4x4 index de 1 a 4
 * ColumnNumber s 
*/
getColumnAux([H|_],1,H):-!.
getColumnAux([_|T],Index,X):-
    Index1 is Index-1,
    getColumnAux(T,Index1,X).

getColumnMatrix([],_,[]).
getColumnMatrix([H|T], Index, [R|X]):-
    getColumnAux(H, Index, R), 
    getColumnMatrix(T,Index,X).
/**
 * Devolve um valor da Matrix com um determinado index de linha e coluna
*/
getValueFromMatrix([H|_T], 0, Column, Value) :-
    getValueFromList(H, Column, Value).
getValueFromMatrix([_H|T], Row, Column, Value) :-
    Row1 is Row - 1,
    getValueFromMatrix(T, Row1, Column, Value).
getValueFromList([H|_T], 0, Value) :-
    Value = H.
getValueFromList([_H|T], Index, Value) :-
    Index1 is Index - 1,
    getValueFromList(T, Index1, Value).


%########################################################################## SETS
/**
 * Devolve uma coluna da matrix
 * getColumnFromMatrix -> only for Search and Find use 
*/
% FOR GET COLUMNS USE PREDICATE TRANSPOSE ->transpose(+Tabuleiro, -TabTransposto) with predicate getLineFromMatrix
    
/**
 * Sunstitui uma linha inteira da matrix
*/
setLineToMatrix([_|T], 0, NewLine,[NewLine|T]).
setLineToMatrix([H|T],Index,NewLine,[H|TNew]):-
    Index1 is Index - 1,
    setLineToMatrix(T, Index1, NewLine,TNew).

/**
 * Substitui num index linha e index coluna um valor especifico
*/
replaceInList([_H|T], 0, Value, [Value|T]).
replaceInList([H|T], Index, Value, [H|TNew]) :-
        Index1 is Index - 1,
        replaceInList(T, Index1, Value, TNew).
replaceInMatrix([H|T], 0, Column,Value, [HNew|T]) :-
        replaceInList(H, Column, Value, HNew).
replaceInMatrix([H|T], Row, Column, Value, [H|TNew]) :-
        Row1 is Row - 1,
        replaceInMatrix(T, Row1, Column, Value, TNew).


/**
* getValueFromListV2(+Lista, +Index, -Value)
* @brief percorre lista(linha) e devolve valor em determinado indice(celula)
* @param +Lista linha da matriz(tabuleiro)
* @param +Index indice na linha(celula)
* @param -Value qual a peca que esta na celula pesquisada
*/
setValueFromListV2([H|_T], 0, Value) :-
    Value = H.
%funcao recursiva para obter o valor na lista
setValueFromListV2([_H|T], Index, Value) :-
    Index1 is Index - 1,
    setValueFromList(T, Index1, Value).

setValueFromMatrixV2([H|_T], 0, Column, Value) :-
    setValueFromList(H, Column, Value).
setValueFromMatrixV2([_H|T], Row, Column, Value) :-
    Row1 is Row - 1,
    setValueFromMatrixV2(T, Row1, Column, Value).
