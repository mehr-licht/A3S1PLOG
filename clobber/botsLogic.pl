%###############################################################################   base do findall Eureka!
/**
 * Devolve Index da linha onde esta a peca com a magia negra do backtracking
* getValueFromListRenew(+Lista, +Index, -Value)
* @brief percorre lista(linha) e devolve valor em determinado indice(celula)
* @param +Lista linha da matriz(tabuleiro)
* @param +Index indice na linha(celula)
* @param -Value qual a peca que esta na celula pesquisada
*/
getValueFromListRenew([H|T], Index, Value) :-
    nth0(Index,[H|T],Value).
/**---------------------------- CASO BASE -------
* Percorre uma linha em primeiro lugar, e depois com o getValueFrom List retorna o Valor
*  getValueFromMatrixRenew([H|_T], 0, Column, Value) 
*/
getValueFromMatrixRenew([H|_T], 0, Column, Value) :-
    getValueFromListRenew(H, Column, Value).

/* getValueFromMatrixRenew(+Lista, +Row, +Column, -Value)
* @brief percorre matriz(tabuleiro) e devolve valor em determinada celula, chamando getValueFromListV2 depois de ter chegado a coluna em causa
* @param +Lista matriz(tabuleiro)
* @param +Row indice da linha
* @param +Column indice da coluna
* @param -Value qual a peca que esta na celula pesquisada
*/
getValueFromMatrixRenew([_H|T], Row1, Column, Value) :-
    getValueFromMatrixRenew(T, Row, Column, Value),
    Row1 is Row + 1.


/**
 * selecionarPecaForBot(+TabuleiroInicial, -LinhaEColuna, +ColorPlayer)
 * @ brief Verifica se a peca escolhida eh da cor passada
 * @param +TabuleiroInicial: tabuleiro actual
 * @param +LinhaEColuna: celula como par
 * @param +ColorPlayer: cor a verificar
 * Verifica se a peca escolhida eh preta
 * selecionarPecaForBot(TabuleiroInicial, [LineIndex-ColumnIndex], ColorPlayer)
*/
selecionarPecaForBot(TabuleiroInicial, [LineIndex-ColumnIndex], ColorPlayer):-
    getValueFromMatrixRenew(TabuleiroInicial, LineIndex, ColumnIndex, ValueAdversario),
    ValueAdversario = ColorPlayer.

%#########################################################################################

/** 
 * posicoesPecasNoTabuleiro(+TabuleiroInicial,+Color,-ListaDePares)
 * @brief Devolve todas as posicoes das pecas de Color actualmente existentes no tabuleiro
 * @param TabuleiroInicial: tabuleiro actual
 * @param Color: cor da peca
 * @param ListaDePares: posicoes de todas as pecas de Color actualmente no tabuleiro
*/
posicoesPecasNoTabuleiro(TabuleiroInicial,Color,ListaDePares):-
    findall([LineIndex-ColumnIndex], selecionarPecaForBot(TabuleiroInicial,[LineIndex-ColumnIndex], Color), ListaDePares).

/** 
 * jogadasNaPosicaoPossiveis(+Tabuleiro,+LineIndex,+ColumnIndex,+ColorPlayer,-ListasJogadas)
 * @brief Devolve lista com todas as jogadas possiveis validas para as pecas de color actualmente existentes no tabuleiro
 * @param +Tabuleiro: tabuleiro actual
 * @param +LineIndex: indice da linha
 * @param +ColumnIndex: indice da coluna
 * @param +ColorPlayer: cor da peca
 * @param -ListasJogadas:  lista com todas as jogadas possiveis validas para as pecas de color actualmente existentes no tabuleiro) 
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
 * direccaoDaJogada(+Tabuleiro,+LinhaEColuna,-Color, -ListaJogadasVizinhas)
 * @brief escolha a jogada seguinte do bot
 * @param +Tabuleiro: tabuleiro actual
 * @param +LinhaEColuna: celula vizinha
 * @param -Color: cor da peca na celula vizinha
 * @param -ListaJogadasVizinhas: jogadas possiveis na celula vizinha
* Devolve todas as solucoes possiveis para aqueler valor
*/
direccaoDaJogada(Tabuleiro,[Line-Column],Color, ListaJogadasVizinhas):-
    findall([NewLineIndex-NewColumnIndex],checkarPecaVizinhaValiada( Tabuleiro, Line, Column, Color,[NewLineIndex-NewColumnIndex]), ListaJogadasVizinhas).

posicaoPecasPretas([[1-1],[1-3],[2-2],[2-4],[3-3],[5-1]]). 
posicaoPecasBrancas([[1-2],[2-1],[3-0],[3-1],[4-1],[4-3]]).

/**
 * choose_move(+Tabuleiro, -TabuleiroFinal, +Nivel)
 * @brief Escolhe o movimento do Bot consoante o nivel escolhido
 * @param +Tabuleiro: tabuleiro actual
 * @param -TabuleiroFinal: tabuleiro futuro
 * @param +Nivel: nivel escolhido para o Bot  (A=Aleatorio; I=Inteligente)
 */
choose_move(Tabuleiro, TabuleiroFinal, Nivel):-
    Nivel=='A',!,%aleatorio
    jogarLeBot(Tabuleiro, TabuleiroFinal).

choose_move(Tabuleiro, TabuleiroFinal, _Nivel):-
    jogarLeBot(Tabuleiro, TabuleiroFinal). %MUDAR PARA FUNCAO INTELIGENTE


/**
 * jogarLeBot(+TabuleiroInicial, -TabuleiroFinal)
 * @brief Generates a random play for the bot without being clever - a black piece eats a white one
 * @param +TabuleiroInicial: tabuleiro actual
 * @param -TabuleiroFinal: tabuleiro futuro
*/
jogarLeBot(Tabuleiro, TabuleiroFinal):-
    posicoesPecasNoTabuleiro(Tabuleiro,black,ListaDePares),
        escolha(Tabuleiro, ListaDePares,ListaParaLimpar),
    cleanLista(ListaParaLimpar, _NovaLista), %Novalista formato [[1-1]-2,[1-3]-1,[2-2]-2,[3-3]-1,[5-1]-1]
   % <-- vouaqui->
   direccaoDaJogada(Tabuleiro,[Line-Column],white, _ListaJogadasVizinhas),
%    escolha(ListaJogadasVizinhas,NewLineIndex,NewColumnIndex),
    replaceInMatrix(_TabuleiroInicial, NewLineIndex, NewColumnIndex, black, TabuleiroNovo),

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
* 
* seleccionarBotJogada(+TabuleiroInicial, +LineIndex, +ColumnIndex, -NewLineIndex, -NewColumnIndex, +ColorPlayer )
* @ Selecciona o Sul, Norte, Oeste, Este,  sequencialmente consoante as jogadas falharem
* @param +TabuleiroInicial: tabuleiro actual
* @param +LineIndex: indice da linha actual da celula
* @param +ColumnIndex: indice da coluna actual da celula
* @param -NewLineIndex: indice da nova linha da celula
* @param -NewColumnIndex: indice da nova coluna da celula
* @param +ColorPlayer: para verificar que a celula escolhido tem adversario
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









