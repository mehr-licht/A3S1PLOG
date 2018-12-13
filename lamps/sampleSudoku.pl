:- use_module(library(clpfd)).

sudoku(N, Sudoku):-
	makeSudoku2D(N, Sudoku),
	%statistics(runtime, [T0|_]),
	solveSudoku(N, Sudoku).
	%statistics(runtime, [T1|_]),
	%T is T1 - T0,
	%fd_statistics,
	%write(T).

solveSudoku(N, Sudoku):-
	applyConstraints(N, Sudoku),
	flattenList(Sudoku, SudokuFlatList),
	labeling([ff, up, bisect], SudokuFlatList). % c)

%%%% Constraint stuff %%%%

applyConstraints(N, Sudoku):-
	applyLineConstraints(N, N, Sudoku),
	applyColumnConstraints(N, N, Sudoku),
	BlockStart is N - 1,
	applyBlockConstraints(BlockStart, N, Sudoku),
	applyConstraintsDiagonal(N, Sudoku). % b)

applyLineConstraints(0, _, _).
applyLineConstraints(Y, N, [Line|Rest]):-
	YTemp is Y - 1,
	applyLineConstraints(YTemp, N, Rest),
	domain(Line, 1, N),
	all_different(Line).

applyColumnConstraints(0, _, _).
applyColumnConstraints(X, N, Sudoku):-
	XTemp is X - 1,
	applyColumnConstraints(XTemp, N, Sudoku),
	getColumn(X, Sudoku, Column),
	domain(Column, 1, N),
	all_different(Column).

applyBlockConstraints(-1, _, _).
applyBlockConstraints(X, N, Sudoku):-
	XTemp is X - 1,
	applyBlockConstraints(XTemp, N, Sudoku),
	getBlock(X, N, Sudoku, Block),
	flattenList(Block, FlatBlock),
	domain(FlatBlock, 1, N),
	all_different(FlatBlock).
