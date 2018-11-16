/*Todos os predicados deste ficheiro analisam o input, relativamente às linhas e colunas inseridas pelo utilizador,
e se as mesmas estão dentro dos limites do tabuleiro. Caso não se satisfaca, pede novamente a informação.*/



manageRow(NewRow) :- readRow(Row),   validateRow(Row, NewRow).

manageColumn(NewColumn) :-
    readColumn(Column),
    validateColumn(Column, NewColumn).

readRow(Row) :-
    write('  #Linha: '),
    read(Row).

readColumn(Column) :-
    write(' #Coluna: '),
    read(Column).


/*--------------------------------------------
* Conjunto de funcoes para validar o input para as linhas
*/
validateRow(1, NewRow) :-NewRow = 1.
validateRow(2, NewRow) :-NewRow = 2.
validateRow(3, NewRow) :-NewRow = 3.
validateRow(4, NewRow) :-NewRow = 4.
validateRow(5, NewRow) :-NewRow = 5.
validateRow(6, NewRow) :-NewRow = 6.
/*
validateRow(_Row, NewRow) :-
    write('Linha erra - linha 33!\n\n'),
    readRow(Input),
    validateRow(Input, NewRow).
*/

/*---------------------------------------------
 Para validar os inputs das colunas -> pode se por uma lista
 */
validateColumn(a, NewColumn) :-NewColumn = 1.
validateColumn(b, NewColumn) :-NewColumn = 2.
validateColumn(c, NewColumn) :-NewColumn = 3.
validateColumn(d, NewColumn) :-NewColumn = 4.
validateColumn(e, NewColumn) :-NewColumn = 5.

/*
validateColumn(_Column, NewColumn) :-
    write('Coluna  Errada - linha 44!\n\n'),
    readColumn(Input),
    validateColumn(Input, NewColumn).
*/
