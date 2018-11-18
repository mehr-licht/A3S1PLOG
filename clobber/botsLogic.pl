
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

%#########################################################################################

/** 
 * jogadasPossiveis(+TabuleiroInicial,+Color,-ListaDePares)
 * Devolve todas as posicoes das pecas no tabuleiro
*/
posicoesPecasNoTabuleiro(TabuleiroInicial,Color,ListaDePares):-
    findall([LineIndex-ColumnIndex], selecionarPecaForBot(TabuleiroInicial,[LineIndex-ColumnIndex], Color), ListaDePares).

/**
 * Devolve as jogadas na PosicaoPossiveis
 * jogadasNaPosicaoPossiveis(+TabuleiroInicial, +LineIndex, +ColumnIndex, +ColorPlayer, -ListasJogadas ) 
*/
jogadasNaPosicaoPossiveis(TabuleiroInicial, LineIndex, ColumnIndex, ColorPlayer, ListasJogadas ):-
    findall([NewLineIndex-NewColumnIndex], seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, ColorPlayer ), ListasJogadas).

/***
 * Selecciona uma peca das pecas do tabuleiro
 * escolha(+Tabuleiro, +ListaDePares,-ListaParaLimpar)
*/              
escolha(_,[],[]).
escolha(Tabuleiro,[[Line-Column]|T], [[Line-Column]-SizeLista|ListaFinal]):-
    escolha(Tabuleiro,T,ListaFinal),
    jogadasNaPosicaoPossiveis(Tabuleiro, Line, Column, white, ListasJogadas),
    length(ListasJogadas, SizeLista).

%NovaLista formato [[1-1]-2,[1-3]-1,[2-2]-2,[3-3]-1,[5-1]-1]
/**
 * cleanLista(+ListaIndexes,+ListaDePares, -NovaLista) 
*/
cleanLista([[Line-Column]-SizeLista|ListaFinal], NovaLista):-
    delete([[Line-Column]-SizeLista|ListaFinal],[_-_]-0, NovaLista).


/**
 * direccaoDaJogada(+Tabuleiro,+[Line-Column],FuturaJogada, -ListaJogadasVizinhas) 
* Devolve todas as solucoes possiveis para aqueler valor
*/
direccaoDaJogada(Tabuleiro,[Line-Column],Color, ListaJogadasVizinhas):-
    findall([NewLineIndex-NewColumnIndex],checkarPecaVizinhaValiada( Tabuleiro, Line, Column, Color,[NewLineIndex-NewColumnIndex]), ListaJogadasVizinhas).

posicaoPecasPretas([[1-1],[1-3],[2-2],[2-4],[3-3],[5-1]]). 
posicaoPecasBrancas([[1-2],[2-1],[3-0],[3-1],[4-1],[4-3]]).

/**
 * @brief Generates a random play for the bot without being clever - a black piece eats a white one
*/
jogarLeBot(Tabuleiro, TabuleiroFinal):-
    posicoesPecasNoTabuleiro(Tabuleiro,black,ListaDePares),
    escolha(Tabuleiro, ListaDePares,ListaParaLimpar),
    cleanLista(ListaParaLimpar, NovaLista), %Novalista formato [[1-1]-2,[1-3]-1,[2-2]-2,[3-3]-1,[5-1]-1]
   % <-- vouaqui->
    direccaoDaJogada(Tabuleiro,[Line-Column],white, ListaJogadasVizinhas),
%    escolha(ListaJogadasVizinhas,NewLineIndex,NewColumnIndex),
    replaceInMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, black, TabuleiroNovo),
    replaceInMatrix(TabuleiroNovo, Line, Column, empty, TabuleiroFinal),
    write('Jogou de '),
    write(Line), 
    write(' '),
    write(Column),
    write(' para '),
    write(NewLineIndex),
    write(' '),
    write(NewColumnIndex),
    write(' E acabou a jogada bot'). 
jogarLeBot(TabuleiroInicial, TabuleiroFinal):-
    choose_move(TabuleiroInicial, TabuleiroFinal).












/**
* Selecciona o Sul, Norte, Oeste, Este,  sequencialmente consoante as jogadas falharem
* seleccionarBotJogada(+TabuleiroInicial, +LineIndex, +ColumnIndex, -NewLineIndex, -NewColumnIndex, ColorPlayer )
*/
%sul
seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, ColorPlayer ):-
    NewLineIndex is LineIndex,
    NewColumnIndex is ColumnIndex -1,
    getValueFromMatrix(TabuleiroInicial, LineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario == ColorPlayer.
%norte
seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, ColorPlayer ):-
    NewLineIndex is LineIndex,
    NewColumnIndex is ColumnIndex +1,
    getValueFromMatrix(TabuleiroInicial, LineIndex, NewColumnIndex, ValueAdversario),
    ValueAdversario == ColorPlayer.
%oeste
seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, ColorPlayer ):-
    NewLineIndex is LineIndex-1,
    NewColumnIndex is ColumnIndex,
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, ColumnIndex, ValueAdversario),
    ValueAdversario == ColorPlayer.
%este
seleccionarBotJogada(TabuleiroInicial, LineIndex, ColumnIndex, NewLineIndex, NewColumnIndex, ColorPlayer ):-
    NewLineIndex is LineIndex+1,
    NewColumnIndex is ColumnIndex,
    getValueFromMatrix(TabuleiroInicial, NewLineIndex, ColumnIndex, ValueAdversario),
    ValueAdversario == ColorPlayer.























%################################## Verificao das pecas encontradas terem pelo menos uma jogada #<begin
    
/**
 * adiconarJogadaNeWLista(+Line, +Column, -NovaLista) 
*/
%adiconarJogadaNeWLista(Line, Column, NovaLista,NovaLista1):-
%   NovaLista = [],
%   !,
%   append([Line-Column],[],NovaLista1).
%   
%adiconarJogadaNeWLista(Line, Column, NovaLista, NovaLista1):-
%    append([Line-Column],NovaLista,NovaLista1).

%#######################################################################################

%   6 pecas BRANCAS com os seus indices verifacaoJogadasPossiveis(Tabuleiro,white,[[Line-Column]|ListaTail])
myListaTeste([[1-2],[2-1],[3-0],[3-1],[4-1],[4-3]]).
%########################################################################################









