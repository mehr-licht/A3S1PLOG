:- use_module(library(clpfd)).
:- use_module(library(lists)).

%-----------------------------------------------------------------------%
%-------------------------Exemplos--------------------------------------%
%-----------------------------------------------------------------------%
%Skyscraper Puzzle 4x4 facil
%BoardSize=4,
%Given=[],
%Visible=[[2,n,1],[3,n,2],[1,n,3],[3,n,4],[2,e,1],[3,e,2],[1,e,3],[2,e,4],[2,s,1],[1,s,2],[4,s,3],[2,s,4],[2,w,1],[1,w,2],[3,w,3],[2,w,4]],
%tempo=0ms
%backtracking=1
%Constraints Created=352

%Skyscraper Puzzle 4x4 dificil
%BoardSize=4,
%Given=[],
%Visible=[[1,s,1],[4,w,1],[3,w,3]],
%tempo=0ms
%backtracking=2
%Constraints Created=79

%Skyscraper Puzzle 5x5 facil
%BoardSize=5,
%Given=[],
%Visible=[[3,n,1],[1,n,2],[2,n,3],[2,n,4],[2,n,5],[3,e,1],[2,e,2],[3,e,3],[1,e,4],[2,e,5],[1,s,1],[5,s,2],[2,s,3],[3,s,4],[2,s,5],[2,w,1],[3,w,2],[2,w,3],[3,w,4],[1,w,5]],
%tempo=0ms
%backtracking=15
%Constraints Created=564

%Skyscraper Puzzle 5x5 dificil
%BoardSize=5,
%Given=[],
%Visible=[[2,n,1],[2,n,2],[4,n,4],[2,e,1],[3,e,3],[2,s,2],[2,s,3],[2,w,4],[3,w,5]],
%tempo=~23ms
%backtracking=638
%Constraints Created=272


%Skyscraper Puzzle 6x6 facil
%BoardSize=6,
%Given=[[3,2,3],[1,5,5]],
%Visible=[[3,n,1],[5,n,2],[1,n,3],[2,n,4],[3,n,5],[2,n,6],[3,e,1],[1,e,2],[2,e,3],[3,e,4],[4,e,5],[6,e,6],[1,s,1],[2,s,2],[3,s,3],[3,s,4],[3,s,5],[5,s,6],[2,w,1],[2,w,2],[2,w,3],[3,w,4],[2,w,5],[1,w,6]],
%tempo=~8ms
%backtracking=52
%Constraints Created=820

%Skyscraper Puzzle 6x6 dificil
%BoardSize=6,
%Given=[[1,1,1],[4,2,2],[2,4,3]],
%Visible=[[1,n,2],[3,n,3],[3,e,1],[3,e,2],[2,e,3],[2,e,5],[2,e,6],[3,s,1],[4,w,3],[2,w,4],[2,w,5]],
%tempo=~41ms
%backtracking=1099
%Constraints Created=409

%Skyscraper Puzzle 7x7 facil
%BoardSize=7,
%Given=[[6,1,1],[7,2,3],[3,2,7],[3,3,5],[6,4,3],[5,4,6],[1,5,7],[2,6,3],[4,7,1],[2,7,2]],
%Visible=[[2,n,1],[2,n,2],[2,n,3],[1,n,4],[3,n,5],[3,n,6],[3,n,7],[2,e,1],[4,e,2],[2,e,3],[4,e,4],[3,e,5],[1,e,6],[2,e,7],[2,s,1],[3,s,2],[3,s,3],[5,s,4],[1,s,5],[4,s,6],[2,s,7],[2,w,1],[2,w,2],[4,w,3],[1,w,4],[2,w,5],[3,w,6],[3,w,7]],
%tempo=~16ms
%backtracking=44
%Constraints Created=1175

%Skyscraper Puzzle 7x7 dificl
%BoardSize=7,
%Given=[[4,2,1],[3,2,2],[2,3,1],[1,3,7],[1,6,3],[3,7,4]],
%Visible=[[3,n,6],[4,n,7],[2,e,4],[5,e,5],[2,e,6],[2,s,2],[2,s,4],[4,s,6],[4,w,3],[2,w,4],[5,w,7]],
%tempo=~5900ms
%backtracking=170429
%Constraints Created=486

%Skyscraper Puzzle 8x8 facil
%BoardSize=8,
%Given=[[3,2,2],[4,3,6],[3,4,4],[5,4,5],[2,4,6],[6,5,3],[8,5,4],[3,5,7],[2,6,4],[5,6,7],[1,6,8],[7,7,2],[4,7,8],[2,8,5]],
%Visible=[[2,n,1],[4,n,2],[3,n,3],[4,n,4],[2,n,5],[3,n,6],[4,n,7],[1,n,8],[1,e,1],[6,e,2],[3,e,3],[3,e,4],[3,e,5],[4,e,6],[3,e,7],[2,e,8],[2,s,1],[3,s,2],[5,s,3],[2,s,4],[5,s,5],[2,s,6],[1,s,7],[2,s,8],[2,w,1],[1,w,2],[4,w,3],[2,w,4],[4,w,5],[2,w,6],[3,w,7],[2,w,8]],
%tempo=~16ms
%backtracking=78
%Constraints Created=1596

%Skyscraper Puzzle 9x9 facil
%BoardSize=9,
%Given=[[2,1,4],[1,2,3],[2,2,7],[1,3,4],[8,3,6],[6,3,7],[3,4,1],[1,5,1],[8,5,3],[2,6,3],[7,6,4],[4,6,6],[2,7,2],[4,7,3],[1,7,5],[3,7,6],[5,8,4],[8,8,5],[6,8,9],[7,9,3]],
%Visible=[[2,n,1],[3,n,2],[1,n,3],[2,n,4],[4,n,5],[3,n,6],[4,n,7],[3,n,8],[3,n,9],[2,s,1],[3,s,2],[3,s,3],[2,s,4],[1,s,5],[5,s,6],[3,s,7],[2,s,8],[4,s,9],[4,e,1],[3,e,2],[1,e,3],[4,e,4],[3,e,5],[2,e,6],[2,e,7],[2,e,8],[2,e,9],[2,w,1],[3,w,2],[3,w,3],[4,w,4],[2,w,5],[3,w,6],[1,w,7],[5,w,8],[4,w,9]],
%tempo=~50ms
%backtracking=570
%Constraints Created=2006
%-----------------------------------------------------------------------%
%----------------------------SKYSCRAPER---------------------------------%
%-----------------------------------------------------------------------%

%teste run
run:-
  % Size of the Board side.
  BoardSize=9,
  % List of Given numbers already on the board (Number,Row,Column)
  Given=[[2,1,4],[1,2,3],[2,2,7],[1,3,4],[8,3,6],[6,3,7],[3,4,1],[1,5,1],[8,5,3],[2,6,3],[7,6,4],[4,6,6],[2,7,2],[4,7,3],[1,7,5],[3,7,6],[5,8,4],[8,8,5],[6,8,9],[7,9,3]],
  % List of Visible buildings (Visible,Direction,RowOrColumn)
  Visible=[[2,n,1],[3,n,2],[1,n,3],[2,n,4],[4,n,5],[3,n,6],[4,n,7],[3,n,8],[3,n,9],[2,s,1],[3,s,2],[3,s,3],[2,s,4],[1,s,5],[5,s,6],[3,s,7],[2,s,8],[4,s,9],[4,e,1],[3,e,2],[1,e,3],[4,e,4],[3,e,5],[2,e,6],[2,e,7],[2,e,8],[2,e,9],[2,w,1],[3,w,2],[3,w,3],[4,w,4],[2,w,5],[3,w,6],[1,w,7],[5,w,8],[4,w,9]],
  statistics(runtime, [T0|_]),
  skyscraper(BoardSize,Given,Visible,Result),
  statistics(runtime, [T1|_]),
  T is T1 - T0,nl,
  printBoardRowValues(Result),
  write('Puzzle solved in: '),write(T),write('ms').

%Solves a skyscraper puzzle size KxK
 skyscraper(K, Given, Visible, Skyscraper):-
  length(Skyscraper, K),
  applyLatinSquareConstraints(Skyscraper,K),
  given(Given,K,Skyscraper),
  visible(Visible, K, Skyscraper),
 flattenList(Skyscraper, SkyscraperFlatten),
  labeling([ffc], SkyscraperFlatten).


%Create the board and apply the latin square constraints
applyLatinSquareConstraints(Skyscraper,K):-
  rows(K, Skyscraper),
  transpose(Skyscraper, SkyscraperT),
  rows(K, SkyscraperT).


%Insert the given numbers on the board
given([], _, _).
given([Given|Rest], K, Skyscraper):-
  nth0(0,Given,N),
  nth0(1,Given,R),
  nth0(2,Given,C),
	/*length(Row, K),*/
	nth1(R, Skyscraper, Row),
	nth1(C, Row, N),
	given(Rest, K, Skyscraper).

%Apply the visibility contraints(Clues)
visible([], _,  _).
visible([Visible|Rest], K, Skyscraper):-
  nth0(0,Visible,V),
  nth0(1,Visible,Dir),
  nth0(2,Visible,RC),
  ( Dir=n -> columnToList(RC, Skyscraper, List)
  ; Dir=e -> nth1(RC, Skyscraper, List1), reverse(List1, List)
  ; Dir=s -> columnToList(RC, Skyscraper, List1), reverse(List1, List)
  ; Dir=w, nth1(RC, Skyscraper, List)),
  /*length(List, K), domain(List,1, K), all_distinct(List),*/
  visnum(List, V),
  visible(Rest, K, Skyscraper).

% visnum(L, K): the number of left-visible numbers in L is K.
visnum([], 0).
visnum([L|Ls], K):-
	visnum(Ls, K, L).
visnum([], 1, _).
visnum([Head|Tail],K, Greatest):-
	(Head #> Greatest) #<=> B,
	B #=> Greatest1 #= Head,
	#\B #=> Greatest1 #= Greatest,
	K #= K1+B,
	visnum(Tail, K1, Greatest1).

% given a list of lists, returns a list containing the cth element of every sublist
columnToList(_, [], _).
columnToList(C, [Row|Rest], [X|List]):-
	/*length(Rest, L), length(List, L),*/
	nth1(C, Row, X),
	columnToList(C, Rest, List).

% checks if every row is of length N and contains each integer from 1 to N exactly once
rows(_, []).
rows(N, [Head|Tail]):-
	length(Head, N),
	domain(Head, 1, N),
	all_distinct(Head),
	rows(N, Tail).

%-----------------------------------------------------------------------%
%-------------------------SKYSCRAPER UTILITIES--------------------------%
%-----------------------------------------------------------------------%

flattenList([], []).
flattenList([H|T], NewList):-
        flattenList(T, Prev),
        pushElementsToList(H, Prev, NewList).

pushElementsToList([], R, R).
pushElementsToList([H|T], Prev, [H|NewList]):-
        pushElementsToList(T, Prev, NewList).

% Print Board
printBoardRowValues([]).
printBoardRowValues([Head | Tail]):-
	write(Head), nl,
  printBoardRowValues(Tail).
