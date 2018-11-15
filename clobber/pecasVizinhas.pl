/**
 * Confirma se se existem pecas vizinhas do adversario, se hover a jogada eh valida!!!
*/
confirmacaoPecaVizinhaPretaEste(TabuleiroInicial,Line,Column,Color):-
    (
        NewLineIndex is Line,
        NewColumnIndex is Column -1,
        NewColumnIndex >= 0 
    ),
    !,
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, ValueAdversario),
    write('entrou 1'),
    nl,
    ValueAdversario == Color.


confirmacaoPecaVizinhaPretaOeste(TabuleiroInicial,Line,Column,Color):-
    NewLineIndex is Line,
    NewColumnIndex is Column +1,
    NewColumnIndex < 5,
    !,
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, ValueAdversario),
    write('entrou 2'),
    ValueAdversario == Color.
    
confirmacaoPecaVizinhaPretaSul(TabuleiroInicial,Line,Column,Color):-
    NewLineIndex is Line - 1,
    NewLineIndex >= 0,
    !,
    NewColumnIndex is Column,
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, ValueAdversario),
    write('entrou 3'),
    ValueAdversario == Color.
   

confirmacaoPecaVizinhaPretaNorte(TabuleiroInicial,Line,Column,Color):-
    NewLineIndex is Line + 1,
    NewColumnIndex is Column,
    NewLineIndex < 6,
    !, 
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, ValueAdversario),
    write('entrou 4'),
    ValueAdversario == Color.
%########################################################################################## <end
/**
 * Devolve yes se houver pelo menos uma jogada
*/
confirmacao4direccoes(TabuleiroInicial,Line,Column, _Color):-
    (
    confirmacaoPecaVizinhaPretaEste(TabuleiroInicial,Line,Column,white);
    confirmacaoPecaVizinhaPretaOeste(TabuleiroInicial,Line,Column,white);
    confirmacaoPecaVizinhaPretaSul(TabuleiroInicial,Line,Column,white);
    confirmacaoPecaVizinhaPretaNorte(TabuleiroInicial,Line,Column,white)
    ).   
