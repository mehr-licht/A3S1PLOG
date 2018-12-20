:-use_module(library(clpfd)).

crossroads(Out):-
Vars=[C,R,O,S,A,D,N,G,E], 
domain(Vars, 0,9),
all_distinct(Vars),
C*10000+R*1000+O+100+S*10+S#=Cross,
R*10000+O*1000+A*100+D*10+S#=Roads,
D*100000+A*10000+N*1000+G*100+E*10+R#=Danger,
Cross+Roads#=Danger,
D#\=0,
C#\=0,
R#\=0,
Out=labeling([],Vars).


donald(Out):-
Vars=[D,O,N,A,L,G,E,R,B,T],
domain(Vars, 0,9),
all_distinct(Vars),
D+10000*O+1000*N+100*A+10*L+D#=Donald,
G+10000*E+1000*R+100*A+10*L+D#=Gerald,
R+10000*O+1000*B+100*E+10*R+T#=Robert,
Donald+Gerald#=Robert,
D#\=0,
G#\=0,
R#\=0,
Out=labeling([],Vars).

sendmore(Out):-
Vars=[S,E,N,D,M,O,R,Y],
domain(Vars,0,9),
all_distinct(Vars),
S*1000+E*100+N*10+D#=Send,
M*1000+O*100*R*10+E#=More,
M*10000+O*1000+N*100+E*10+Y#=Money,
Send+More#=Money,
S#\=0,
M#\=0,
Out=labeling([],Vars).


puzzle(Qual,Palavra1,Palavra2,Soma):-
Qual == 2, crossroads(Vars),!,
Qual == 1, donald(Vars),!,
Qual == 3, sendmore(Vars).

