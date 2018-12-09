:- use_module(library(clpfd)).

/**
 * @brief tabuleiro de teste caso dado
 */
testeBoard([
    [empty,empty,empty,empty,empty,empty],
         [empty,4,6,6,5,empty],
         [empty,5,2,6,4,empty],
         [empty,4,6,6,6,empty],
         [empty,4,6,6,4,empty],
    [empty,empty,empty,empty,empty,empty]        
]).

testev1([
    [A1,A2,A3,A4,A5,A6],
    [B1,4,6,6,5,B6],
    [C1,5,2,6,4,C6],
    [D1,4,6,6,6,D6],
    [E1,4,6,6,4,E7],
    [F1,F2,F3,F4,F5,F6]        
]).

%solution 
%    [2, 4, 3, 1] 
%    [4,....., 2]
%    [3, ....., 2]
%    [4, ....., 3]
%    [0, ....., 4]
%    [2, 2, 3, 2] 
%Tratamento dos cantos vazios    

sol([   [A1,A2,A3,A4,A5,A6], [B1,4,6,6,5,B6], [C1,5,2,6,4,C6], [D1,4,6,6,6,D6], [E1,4,6,6,4,E7], [F1,F2,F3,F4,F5,F6] ]):-
    Vars = [A2,A3,A4,A5,B1,B6,C1,C6,D1,D6,E1,E7,F2,F3,F4,F5],
    domain(Vars,0,4),
    A1 #= 0,
    A6 #= 0,
    F1 #= 0,
    F6 #= 0,
    labeling([],Vars).

%sample(S1,S2,S3,S4,S5,S6,S7,S8):-
%    domain([S1,S2,S3,S4,S5,S6,S7,S8],0,2),
%    labeling([],[S1,S2,S3,S,S5,S6,S7,S8]).

sample(X):-
    domain([A,B,C],1,5),
    count(1,[A,B,C],#=,X),
    labeling([],[A,B,C]).


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