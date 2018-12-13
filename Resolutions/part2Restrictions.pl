:-use_module(library(clpfd)).

soma([A1,A2,A3,A4,A5,A6,A7,A8,A8]):-
    domain([A1,A2,A3,A4,A5,A6,A7,A8,A8],1,9),
    write('test'),
    
    A1+A2+A3 #= A4+A5+A6,
    A4+A5+A6 #= A7+A8+A9,
    A7+A8+A9 #= A1+A4+A7,
    A1+A4+A7 #= A2+A5+A8,
    A2+A5+A8 #= A3+A6+A9,
    labeling([],[A1,A2,A3,A4,A5,A6,A7,A8,A8]).

soma1:-
    Vars = [A1,A2,A3,
            A4,A5,A6,
            A7,A8,A9],
    domain(Vars,1,9),
    all_distinct(Vars),
    %horizontais
    A1+A2+A3 #= S,
    A4+A5+A6 #= S,
    A7+A8+A9 #= S,
    %verticias
    A1+A4+A7 #= S,
    A2+A5+A8 #= S,
    A3+A6+A9 #= S,
    %diagonais
    A1+A5+A9 #= S,
    A7+A5+A3 #= S,
    labeling([],Vars),
    write(Vars).

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
   % write(Vars).

puzzle1(Vars):-
    Vars = [D,O,N,A,L,G,E,R,B,T],
    domain(Vars,0,9),
    all_distinct(Vars),
    D*100000+O*10000+N*1000+A*100+L*10+D #= Cross,
    G*100000+E*10000+R*1000+A*100+L*10+D #= Roads,
    Cross + Roads #= Total,
    R*100000+O*10000+B*1000+E*100+R*10+T #= Total,
%    D #> 0,
 %   R #> 0,
 %   D #= 1,
% write(Lista1),
   % write(Lista2),
    labeling([],Vars).

%adicionar carry
% adicionar nova lista c=[C1,C2,C3,C4,C5]
% a CADA VARIAVEL SOMAR O CARRY C1
% S +S #= C1 *10 +R,
% C1 + S +D #= C2 *10 +E 
%C1C2C3C4C5 -> CARRYS
% CROSS
% ROADS
%________
%DANGER
    

sol(A,B,C):-
    domain([A,B,C],1,1000),
    A*B*C #= A+B+C,
    % C#>=B, B#>=A,
    %Eliminar simetrias
    labeling([],[A,B,C]).
    
    