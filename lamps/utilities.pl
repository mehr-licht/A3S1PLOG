
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
 * 
*/
%setColumnAux([_|_],1, [H|_], H):-!.
%setColumnAux([_|T],Index, [_|TList],X):-
%    Index1 is Index-1,
%    setColumnAux(T,Index1, TList, X).

%setColumnMatrix([],1,_,[]).
%setColumnMatrix([H|T], Index,Lista, [R|X]):-
%    NewIndex is Index-1,
%    setColumnAux(H, Index,Lista, R), 
%    setColumnMatrix(T,NewIndex,Lista,X).

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

/**
 * @brief TESTES                TESTES                      TESTES
 */
testBoard([
    [empty,empty,empty,empty,empty,empty],
         [empty,4,6,6,5,empty],
         [empty,5,2,6,4,empty],
         [empty,4,6,6,6,empty],
         [empty,4,6,6,4,empty],
    [empty,empty,empty,empty,empty,empty]        
]).


linha([1,2,3,4]).
%testev1([
%    [A1,A2,A3,A4,A5,A6],
%    [B1,4,6,6,5,B6],
%    [C1,5,2,6,4,C6],
%    [D1,4,6,6,6,D6],
%    [E1,4,6,6,4,E7],
%    [F1,F2,F3,F4,F5,F6]        
%]).

%solution 
%    [2, 4, 3, 1] 
%    [4,....., 2]
%    [3, ....., 2]
%    [4, ....., 3]
%    [0, ....., 4]
%    [2, 2, 3, 2] 
%Tratamento dos cantos vazios    

%sol([   [A1,A2,A3,A4,A5,A6], [B1,4,6,6,5,B6], [C1,5,2,6,4,C6], [D1,4,6,6,6,D6], [E1,4,6,6,4,E7], [F1,F2,F3,F4,F5,F6] ]):-
%    Vars = [A2,A3,A4,A5,B1,B6,C1,C6,D1,D6,E1,E7,F2,F3,F4,F5],
%    domain(Vars,0,4),
%    A1 #= 0,
%    A6 #= 0,
%    F1 #= 0,
%    F6 #= 0,
%    labeling([],Vars).

%sample(S1,S2,S3,S4,S5,S6,S7,S8):-
%    domain([S1,S2,S3,S4,S5,S6,S7,S8],0,2),
%    labeling([],[S1,S2,S3,S,S5,S6,S7,S8]).

%sample(X):-
%    domain([A,B,C],1,5),
%    count(1,[A,B,C],#=,X),
%    labeling([],[A,B,C]).


%qual o preco de perus da 3672/72 = 51
perus(A,B,C,D):-
    Vars = [A,B,C,D],
    domain(Vars,0,9),
    B #= 6,
    C #= 7,
    A #\= 0,
    A*1000+B*100+C*10+D #= S,
    S mod 72 #= 0,
    labeling([],Vars).

% Não esquecer de colocar em todos os programas!
%CLP que permita resolver o problema das N-Rainhas. Este problema
%consiste em colocar, num tabuleiro com NxN casa, N rainhas (de xadrez), sem que nenhuma rainha
%ataque uma outra rainha posicionada no tabuleiro (isto é, na horizontal, vertical ou diagonal).
nqueens(Cols):-
    Cols=[A1,A2,A3,A4],
    domain(Cols,1,4),
    all_distinct(Cols),
    %A1#\=A2, A1#\A3, A1#\A4, A2#\A3, A2#\A4, A3#\A4,
    A1#\=A2+1, A1#\=A2-1, A1#\=A3+2, A1#\=A3-2, A1#\=A4+3, A1#\=A4-3,
    A2#\=A3+1, A2#\=A3-1, A2#\=A4+2, A2#\=A4-2,
    A3#\=A4+1, A3#\=A4-1,
    labeling([],Cols).

%Solução 4 b):
nqueens1(N,Cols):-
    length(Cols,N),
    domain(Cols,1,N),
    constrain(Cols),
   all_distinct(Cols),
    labeling([],Cols).
% Redundante mas diminui o tempo de resolução
constrain([]).
constrain([H | RCols]):-
    safe(H,RCols,1),
    constrain(RCols).
safe(_,[],_).
safe(X,[Y | T], K) :-
    noattack(X,Y,K),
    K1 is K + 1,
    safe(X,T,K1).
noattack(X,Y,K) :-
    X #\= Y,
    X + K #\= Y,
    X - K #\= Y.
%
%
%Test: nqueens(4,C).
%        C = [2, 4, 1, 3]
%    More? (;)
%        C = [3, 1, 4, 2]
%More? (;)
%        no (more) solutio