/*Todos os predicados deste ficheiro analisam o input, relativamente às linhas e colunas inseridas pelo utilizador,
e se as mesmas estão dentro dos limites do tabuleiro. Caso não se satisfaca, pede novamente a informação.*/

manageRow(NewRow) :-
    readRow(Row),
    validateRow(Row, NewRow).

manageColumn(NewColumn) :-
    readColumn(Column),
    validateColumn(Column, NewColumn).

readRow(Row) :-
    write('  #Linha: '),
    read(Row).

readColumn(Column) :-
    write(' #Coluna: '),
    read(Column).

%--------------------------------------------
% Conjunto de funcoes para validar o input para as linhas
validateRow(1, NewRow) :-NewRow = 1.
validateRow(2, NewRow) :-NewRow = 2.
validateRow(3, NewRow) :-NewRow = 3.
validateRow(4, NewRow) :-NewRow = 4.
validateRow(5, NewRow) :-NewRow = 5.
validateRow(6, NewRow) :-NewRow = 6.

validateRow(_Row, NewRow) :-
    write('Linha escolhida nao valida!\n\n'),
    readRow(Input),
    validateRow(Input, NewRow).


%---------------------------------------------
%Para validar os inputs das colunas -> pode se por uma lista
validateColumn('A', NewColumn) :-NewColumn = 1.
validateColumn('B', NewColumn) :-NewColumn = 2.
validateColumn('C', NewColumn) :-NewColumn = 3.
validateColumn('D', NewColumn) :-NewColumn = 4.
validateColumn('E', NewColumn) :-NewColumn = 5.


validateColumn(_Column, NewColumn) :-
    write('Coluna escolhido fora do tabuleiro!\n\n'),
    readColumn(Input),
    validateColumn(Input, NewColumn).


%---------------------------------------------
/*
manageMoveWorkerBool(NewMoveWorkerBool):-
      read(MoveWorkerBool),
      validateMoveWorkerBool(MoveWorkerBool, NewMoveWorkerBool).

validateMoveWorkerBool(1, NewMoveWorkerBool) :-
    NewMoveWorkerBool = 1.

validateMoveWorkerBool(0, NewMoveWorkerBool) :-
    NewMoveWorkerBool = 0.

validateMoveWorkerBool(_Bool, NewMoveWorkerBool) :-
    write('\nERROR: That answer is not valid, please try again![0(No)/1(Yes)]'),
    read(Input),
    validateMoveWorkerBool(Input, NewMoveWorkerBool).
*/