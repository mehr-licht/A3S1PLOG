%---------------------------------------------------------------
% funcoes de complemento
% caso base o Value vai se juntar ah nova lista
replaceInList([_H|T], 0, Value, [Value|T]).
% funcao de chamada recursiva para percorrer a lsita
replaceInList([H|T], Index, Value, [H|TNew]) :-
        Index > 0,
        Index1 is Index - 1,
        replaceInList(T, Index1, Value, TNew).

%----------------------------------------------------------------
% caso base Substituir um valor na matrix em complemento com as anteriores
% caso base
replaceInMatrix([H|T], 0, Column,Value, [HNew|T]) :-
        replaceInList(H, Column, Value, HNew).
% percorrer a lista de listas
replaceInMatrix([H|T], Row, Column, Value, [H|TNew]) :-
        Row > 0,
        Row1 is Row - 1,
        replaceInMatrix(T, Row1, Column, Value, TNew).


%----------------------------------------------------------------
%caso base
getValueFromList([H|_T], 0, Value) :-
        Value = H.
%funcao recursiva para obter o valor na lista
getValueFromList([_H|T], Index, Value) :-
        Index > 0,
        Index1 is Index - 1,
        getValueFromList(T, Index1, Value).


%----------------------------------------------------------------
% Uma matrix eh uma lista de listas
% Percorre uma linha em primeiro lugar, e depois com o getValueFrom List retorna o Valor
% Caso base quando estamos na ultima linha
getValueFromMatrix([H|_T], 0, Column, Value) :-
        getValueFromList(H, Column, Value).
%Percorre cada linha - funcao recursiva que em cada lista chama o getValueFromLis
getValueFromMatrix([_H|T], Row, Column, Value) :-
        Row > 0,
        Row1 is Row - 1,
        getValueFromMatrix(T, Row1, Column, Value).

%----------------------------------------------------------------
% Funcionava para valores nao repetidos
%Quando encontra um valorASubstituir no head põe lá o Newvalue
%Com muitos campos iguais, esta funcao para no primeiro atomo que encontra igual e nao substitui os outros
replaceInList_v1([_H|T], ValorASubstituir, NewValue, [NewValue|T]):-   _H = ValorASubstituir.  
% funcao de chamada recursiva para percorrer a lsita
replaceInList_v1([H|T], ValorASubstituir, NewValue, [H|TNew]) :-
        %Index > 0,
        %Index1 is Index - 1,
        replaceInList_v1(T, ValorASubstituir, NewValue, TNew).










/*Analisa o que está na célula (Row, Column) da matriz. Retorna em Value o 
conteúdo daquela célula, ou, caso Value já esteja atribuído, a função falha.*/
getWorkersPosColumn(Board, Value, Row, Column, WorkerRow, WorkerColumn) :-
        (getValueFromMatrix(Board, Row, Column, Value),
        WorkerRow = Row, WorkerColumn = Column);
        (Column < 11,
        Column1 is Column + 1,
        getWorkersPosColumn(Board, Value, Row, Column1, WorkerRow, WorkerColumn)).

getWorkersPosRow(Board, Value, Row, Column, WorkerRow, WorkerColumn) :-
        getWorkersPosColumn(Board, Value, Row, Column, WorkerRow, WorkerColumn);
        (Row < 11,
        Row1 is Row + 1,
        getWorkersPosRow(Board, Value, Row1, Column, WorkerRow, WorkerColumn)).

/*Percorre o tabuleiro e com a ajuda do predicado getValueFromMatrix, devolve 
em WorkerRow1, WorkerColumn1, WorkerRow2 e WorkerColumn2 as posições dos workers 
na matriz. */
getWorkersPos(Board, WorkerRow1, WorkerColumn1, WorkerRow2, WorkerColumn2) :-
        Value = red,
        getWorkersPosRow(Board,Value, 0,0, WorkerRow1, WorkerColumn1),
        replaceInMatrix(Board, WorkerRow1, WorkerColumn1, 'RED', NewBoard), %substituir worker1 por RED para nao ser considerado quando  procurar worker2.
        getWorkersPosRow(NewBoard,Value, 0,0, WorkerRow2, WorkerColumn2).

/*Verifica se o tabuleiro está cheio, confirmando se não há nenhuma célula
‘empty’ no tabuleiro.*/
checkFullBoard(Board) :-
      \+ (append(_, [R|_], Board),
	append(_, ['empty'|_], R)).
