

/**
 * Jogadas Validas -> para depois ter a boa lista e escolher um random
*/
jogadasValidas(Tabuleiro,Color,[FutureLine-FutureColumn]):-
    jogadasPossiveis(Tabuleiro,Color,[[Line-Column]|ListaTail]),
    verifacaoJogadasPossiveis(Tabuleiro,Color,[[Line-Column]|ListaTail]),
    seleccionarJogadaLista(Tabuleiro,Color,[[Line-Column]|ListaTail],[FutureLine-FutureColumn]).    
    %percorer a lista e por cada elemento verificose ha jogada selecioanrBot,
    %seleccionarBotJogada(Tabuleiro, Line, Column, NewLineIndex, NewColumnIndex, Color)

/**
 * Função muito futurista -escolhe a jogada futurista
*/
seleccionarJogadaLista(Tabuleiro,Color,Lista,FuturaJogada):-
    length(Lista,Lengthlista),
    random(0,Lengthlista,FutureIndex),
    nth0(FutureIndex,Lista,FuturaJogada). %Que beleza ate vou tirar um fotografia




%###############################################################################   base do findall Eureka!
/**
 * Devolve Index da linha onde esta a peca com a magia negra do backtracking
*/
getValueFromListRenew([H|T], Index, Value) :-
    nth0(Index,[H|T],Value).
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

/**
 * Verifica se a peca escolhida eh preta
 * selecionarPecaForBot(TabuleiroInicial, [LineIndex-ColumnIndex], ColorPlayer)
*/
selecionarPecaForBot(TabuleiroInicial, [LineIndex-ColumnIndex], ColorPlayer):-
    getValueFromMatrixRenew(TabuleiroInicial, LineIndex, ColumnIndex, ValueAdversario),
    ValueAdversario = ColorPlayer.

/** Look at this beauty! -Agora sei como Eisntein se sentia
 * 
 * jogadasPossiveis(+TabuleiroInicial,+Color,-ListaDePares)
 * Devolve todas as posicoes da peca desejada 
*/
jogadasPossiveis(TabuleiroInicial,Color,ListaDePares):-
    findall([LineIndex-ColumnIndex], selecionarPecaForBot(TabuleiroInicial,[LineIndex-ColumnIndex], Color), ListaDePares).


%####################################################################### <end find all base



%################################## Verificao das pecas encontradas terem pelo menos uma jogada #<begin
/**
 * Devolve a lista com as jogadas possiveis
 * Not sure if the backtracking will remove and maybe i dont need another list
 * needs testing
*/
verifacaoJogadasPossiveis(Tabuleiro,Color,[]).
verifacaoJogadasPossiveis(Tabuleiro,Color,[[Line-Column]|ListaTail]):-
    confirmacaoPecaVizinha(Tabuleiro,Line,Column, Color),
    !,              %concluir amanha depois de estudar umpouco
    verifacaoJogadasPossiveis(Tabuleiro,Color,ListaTail).
verifacaoJogadasPossiveis(Tabuleiro,Color,[[Line-Column]|ListaTail]):-
    %delete([[Line-Column]|ListaTail],[Line-Column],[_Head|ListaTail] ),
    %uuuaaauuu maravilhado, parece maagia
    write(Line),
    nl,
    write(Column),
    nl,
    verifacaoJogadasPossiveis(Tabuleiro, Color, ListaTail).
%    verifacaoJogadasPossiveis(Tabuleiro,Color,[[Line-Column]|ListaTail])

/**
 * Confirma se se existem pecas vizinhas do adversario, se hover a jogada eh valida!!!!
*/
confirmacaoPecaVizinha(TabuleiroInicial,Line,Column,Color):-
    NewLineIndex is Line,
    NewColumnIndex is Column -1,
    NewColumnIndex >= 0,
    !,
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario \= Color.
confirmacaoPecaVizinha(TabuleiroInicial,Line,Column,Color):-
    NewLineIndex is Line,
    NewColumnIndex is Column +1,
    NewColumnIndex < 5,
    !,
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario \= Color.
confirmacaoPecaVizinha(TabuleiroInicial,Line,Column,Color):-
    NewLineIndex is Line - 1,
    NewLineIndex >= 0,
    !,
    NewColumnIndex is Column,
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario \= Color.
confirmacaoPecaVizinha(TabuleiroInicial,Line,Column,Color):-
    NewLineIndex is Line + 1,
    NewColumnIndex is Column,
    NewLineIndex < 6,
    !, 
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario \= Color.
%########################################################################################## <end

checkarPecaVizinhaValiada(Line,Column,Color,[NewLineIndex-NewColumnIndex]):-
    NewLineIndex is Line,
    NewColumnIndex is Column -1,
    getValueFromMatrix(TabuleiroInicial, LineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario =:= ColorPlayer.
checkarPecaVizinhaValiada(Line,Column,Color,[NewLineIndex-NewColumnIndex]):-
    NewLineIndex is Line,
    NewColumnIndex is Column +1,
    getValueFromMatrix(TabuleiroInicial, LineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario =:= ColorPlayer.
checkarPecaVizinhaValiada(Line,Column,Color, [NewLineIndex-NewColumnIndex]):-
    NewLineIndex is Line - 1,
    NewColumnIndex is Column,
    getValueFromMatrix(TabuleiroInicial, LineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario =:= ColorPlayer.
checkarPecaVizinhaValiada(Line,Column,Color,[NewLineIndex-NewColumnIndex]):-
    NewLineIndex is Line + 1,
    NewColumnIndex is Column,
    getValueFromMatrix(TabuleiroInicial, LineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario =:= ColorPlayer.





direccaoDaJogada(Tabuleiro,[Line-Column],FuturaJogada, ListaJogadasVizinhas):-
    findall([NewLineIndex-NewColumnIndex],checkarPecaVizinhaValiada( Line, Column, Color,[NewLineIndex-NewColumnIndex]), ListaJogadasVizinhas),
    seleccionarJogadaLista(Tabuleiro,Color,Lista,FuturaJogada).
   
  %  !,
  %  confirmacaoPecaVizinha(Line,Column,Color), 
  %  confirmacaoPecaVizinha(Line,Column,Color),
  %  confirmacaoPecaVizinha(Line,Column,Color),
  %  confirmacaoPecaVizinha(Line1,Column,Color)
%defenir u, random de quatro valores ???
%fazer uma lista de valores ??


/**
 * @brief Generates a random play for the bot without being clever - a black piece eats a white one
*/
jogarLeBot(TabuleiroInicial, TabuleiroFinal):-
    jogadasValidas(TabuleiroInicial,Color,[Line-Column]),
    direccaoDaJogada(TabuleiroInicial,[Line-Column],[NewLineIndex, NewColumnIndex], ListaJogadasVizinhas),
    !,
    replaceInMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, black, TabuleiroNovo),
    replaceInMatrix(TabuleiroNovo, Line, Column, empty, TabuleiroFinal),
    write('Jogou de '),
    write(LineIndex), 
    write(' '),
    write(ColumnIndex),
    write(' para '),
    write(NewLineIndex),
    write(' '),
    write(NewColumnIndex),
    write(' E acabou a jogada bot'). 
jogarLeBot(TabuleiroInicial, TabuleiroFinal):-
    choose_move(TabuleiroInicial, TabuleiroFinal).
























%####################################################################################################3

/**
* Selecciona o Sul, Norte, Oeste, Este,  sequencialmente consoante as jogadas falharem
* seleccionarBotJogada(+TabuleiroInicial, +LineIndex, +ColumnIndex, -NewLineIndex, -NewColumnIndex, ColorPlayer )
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
