
/**
 * Verifica se a peca escolhida eh preta
*/
selecionarPecaForBot(TabuleiroInicial, [LineIndex-ColumnIndex], ColorPlayer):-
    getValueFromMatrixRenew(TabuleiroInicial, LineIndex, ColumnIndex, ValueAdversario),
    ValueAdversario = ColorPlayer.

/** Look at this beauty! -Agora sei como Eisntein se sentia
 * jogadasPossiveis(+TabuleiroInicial,+Color,-ListaDePares)
 * Devolve todas as posicoes da peca desejada 
*/
jogadasPossiveis(TabuleiroInicial,Color,ListaDePares):-
    findall([LineIndex-ColumnIndex], selecionarPecaForBot(TabuleiroInicial,[LineIndex-ColumnIndex], Color), ListaDePares).

/**
 * Devolve Index da linha onde esta a peca com a magia negra do backtracking
*/
getValueFromListRenew([H|T], Index, Value) :-
    nth0(Index, [H|T],Value).
/**----------------------------------------------------------------
* Uma matrix eh uma lista de listas -> wooahh Sherlock
* Percorre uma linha em primeiro lugar, e depois com o getValueFrom List retorna o Valor
* Caso base quando estamos na ultima linha
*/
getValueFromMatrixRenew([H|_T], 0, Column, Value) :-
    getValueFromListRenew(H, Column, Value).

/**Devolve o numero de linha no backtracking de volta para juntar ao par de coordenadas
 * Admiravel mundo novo
*/
getValueFromMatrixRenew([_H|T], Row1, Column, Value) :-
    getValueFromMatrixRenew(T, Row, Column, Value),
    Row1 is Row +1.


%####################################################################################################3

/**
 * Selecciona o Sul, Norte, Oeste, Este,  sequencialmente consoante as jogadas falharem
*/
%sul
seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, ColorPlayer ):-
    NewLineIndex is LineIndex,
    NewColumnIndex is ColumnIndex -1,
    getValueFromMatrix(TabuleiroInicial, LineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario = ColorPlayer.
%norte
seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, ColorPlayer ):-
    NewLineIndex is LineIndex,
    NewColumnIndex is ColumnIndex +1,
    getValueFromMatrix(TabuleiroInicial, LineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario = ColorPlayer.
%oeste
seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, ColorPlayer ):-
    NewLineIndex is LineIndex-1,
    NewColumnIndex is ColumnIndex,
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, ColumnIndex, ValueAdversario),
    ValueAdversario = ColorPlayer.
%este
seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, ColorPlayer ):-
    NewLineIndex is LineIndex+1,
    NewColumnIndex is ColumnIndex,
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, ColumnIndex, ValueAdversario),
    ValueAdversario = ColorPlayer.

/**
 * @brief Generates a random play for the bot without being clever - a black piece eats a white one
*/
choose_move(TabuleiroInicial, TabuleiroFinal):-
    
    selecionarPecaForBot(TabuleiroInicial, [LineIndex-ColumnIndex], black),
    seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, white),
    !,
    replaceInMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, black, TabuleiroNovo),
    replaceInMatrix(TabuleiroNovo, LineIndex, ColumnIndex, empty, TabuleiroFinal),
    write('Jogou de '),
    write(LineIndex), 
    write(' '),
    write(ColumnIndex),
    write(' para '),
    write(NewLineIndex),
    write(' '),
    write(NewColumnIndex),
    write(' E acabou a jogada bot').    
choose_move(TabuleiroInicial, TabuleiroFinal):-
    choose_move(TabuleiroInicial, TabuleiroFinal).