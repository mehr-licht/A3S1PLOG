
/**
 * Verifica se a peca escolhida eh preta
*/
selecionarPecaForBot(TabuleiroInicial, LineIndex, ColumnIndex, ColorPlayer):-
    random(1, 6, LineIndex),
    random(1, 5, ColumnIndex),
    getValueFromMatrix(TabuleiroInicial, LineIndex, ColumnIndex, ValueAdversario),
    ValueAdversario = ColorPlayer,
    !,
    write(' Jogou :) ').

selecionarPecaForBot(TabuleiroInicial, LineIndex,ColumnIndex, ColorPlayer):-
    write(' Re-jogou :( '),
    selecionarPecaForBot(TabuleiroInicial, LineIndex,ColumnIndex, ColorPlayer).



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
    ValueAdversario = ColorPlayer,
    bot_play(TabuleiroInicial, NovoTabuleiro).


/**
 * @brief Generates a random play for the bot without being clever - a black piece eats a white one
*/
bot_play(TabuleiroInicial, TabuleiroFinal):-
    selecionarPecaForBot(TabuleiroInicial, LineIndex, ColumnIndex, black),
    seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, white),
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
