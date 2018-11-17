


/**
 * Função muito futurista -escolhe a jogada futurista
 * seleccionarJogadaLista(_Tabuleiro,_Color,+Lista,-FuturaJogada)
 * @brief recebendo lista de jogadas possiveis, escolhe uma ao acaso
 * @param +Lista: lista de jogadas possiveis
 * @param -FuturaJogada: a jogada a ser feita
*/
seleccionarJogadaLista(_Tabuleiro,_Color,Lista,FuturaJogada):-
    length(Lista,Lengthlista),
    random(0,Lengthlista,FutureIndex),
    nth0(FutureIndex,Lista,FuturaJogada). %Que beleza ate vou tirar um fotografia




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
/**----------------------------------------------------------------
* Uma matrix eh uma lista de listas -> wooahh Sherlock
* Percorre uma linha em primeiro lugar, e depois com o getValueFrom List retorna o Valor
* Caso base quando estamos na ultima linha
*
 * getValueFromMatrixRenew(+Lista, +Row, +Column, -Value)
* @brief percorre matriz(tabuleiro) e devolve valor em determinada celula, chamando getValueFromListV2 depois de ter chegado a coluna em causa
* @param +Lista matriz(tabuleiro)
* @param +Row indice da linha
* @param +Column indice da coluna
* @param -Value qual a peca que esta na celula pesquisada
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
 * selecionarPecaForBot(+TabuleiroInicial, -LinhaEColuna, +ColorPlayer)
 * @ brief Verifica se a peca escolhida eh da cor passada
 * @param +TabuleiroInicial: tabuleiro actual
 * @param +LinhaEColuna: celula como par
 * @param +ColorPlayer: cor a verificar
*/
selecionarPecaForBot(TabuleiroInicial, [LineIndex-ColumnIndex], ColorPlayer):-
    getValueFromMatrixRenew(TabuleiroInicial, LineIndex, ColumnIndex, ValueAdversario),
    ValueAdversario = ColorPlayer.


/**
 * verificacao(+Tabuleiro,+Color,-Lista, -ListaFinal,-ListaFinalissima)
 * @brief devolve lista das pecas com jogadas possiveis
 * @param +Tabuleiro: tabuleiro actual
 * @param +Color: cor da peca
 * @param -Lista: lista das pecas no tabuleiro
 * @param -ListaFinal: lista das pecas jogaveis
 * @param -ListaFinalissima: 
 *
*/

%verificacao(Tabuleiro,Color,[[Line-Column]|ListaTail],[]).
%verificacao(_,_,_, _,[]).
verificacao(_,_,[], _,_).
verificacao(Tabuleiro,Color,[[Line-Column]|ListaTail], ListaFinal,ListaFinalissima):-
    jogadasValidasPorPeca(Tabuleiro,Line, Column, white, ListaDePares),
    nl, 
    length(ListaDePares,LengthLista), %nao existem jogadas para esta peca -> logo posso eliminah-la
    cleanList(Tabuleiro,Color,[Line-Column],ListaFinal,LengthLista, ListaFinalissima),    
  %  write('ListaPares:---1'), write(ListaDePares),nl,
  %  write('Lista de pecas --- 2'),write([[Line-Column]|ListaTail]),nl,
  write('ListaFinal:---1'), write(ListaFinalissima),nl,
  %  write(LengthLista),
    %ListaDePares = NewLista,
  %  LengthLista =:= 0,
   % !,              
   % delete(ListaFinal, [Line-Column], ListaFinalissima),
    verificacao(Tabuleiro,Color,ListaTail,ListaFinal, ListaFinalissima).
%verificacao(Tabuleiro,Color,[[Line-Column]|ListaTail],ListaFinal):-  
  %  verificacao(Tabuleiro, Color, ListaTail, ListaFinal).
/**
 * cleanList(+Tabuleiro,+Color,+Lista,+ListaFinal,+LengthLista,-ListaFinalissima)
 * @brief Retira da lista todas as peças sem jogadas possiveis
 * @param +Tabuleiro: tabuleiro actual
 * @param +Color: cor da peca
 * @param +Lista: lista de jogadas validas por peca
 * @param +ListaFinal: lista das pecas existentes
 * @param +LengthLista: tamanho da lista de jogadas validas por peca
 * @param -ListaFinalissima: lista das pecas sem jogadas possiveis
 */
cleanList(Tabuleiro,Color,[Line-Column],ListaFinal,LengthLista,ListaFinalissima):-
    write('---aqui-1--'), write(LengthLista),
    LengthLista < 1,
    !,
    write([Line-Column]),nl,
    delete(ListaFinal, [Line-Column], ListaFinalissima),
    write(ListaFinalissima),    
    length(ListaFinalissima,LengthListaAA), nl,
    write('---aqui--2-'), write(LengthListaAA).
cleanList(Tabuleiro,Color,[Line-Column],ListaFinal,LengthLista,ListaFinalissima):-true.




/** 
 * jogadasPossiveis(+TabuleiroInicial,+Color,-ListaDePares)
 * @brief Devolve todas as posicoes das pecas de Color actualmente existentes no tabuleiro
 * @param TabuleiroInicial: tabuleiro actual
 * @param Color: cor da peca
 * @param ListaDePares: posicoes de todas as pecas de Color actualmente no tabuleiro
*/
jogadasPossiveis(TabuleiroInicial,Color,ListaDePares):-
    findall([LineIndex-ColumnIndex], selecionarPecaForBot(TabuleiroInicial,[LineIndex-ColumnIndex], Color), ListaDePares).

/** 
 * jogadasPossiveisValidas(+Tabuleiro,+Color,-NewList)
 * @brief Devolve lista com todas as pecas de Color com jogadas possiveis actualmente existentes no tabuleiro
 * @param +Tabuleiro: tabuleiro actual
 * @param +Color: cor da peca
 * @param -NewList: posicoes de todas as pecas de Color com jogadas possiveis actualmente no tabuleiro
*/
jogadasPossiveisValidas(Tabuleiro,Color, NewList):-
    jogadasPossiveis(Tabuleiro,Color,[[L-C]|T]),
    [[L-C]|T] == [[]|[]],
    !,
    verificacao(Tabuleiro, Color, [[L-C]|T], NewList).
    

/** 
 * jogadasValidas(+Tabuleiro,+Color,-NewList)
 * @brief Devolve lista com todas as jogadas possiveis validas para as pecas de color actualmente existentes no tabuleiro
 * @param +Tabuleiro: tabuleiro actual
 * @param +Color: cor da peca
 * @param -NewList:  lista com todas as jogadas possiveis validas para as pecas de color actualmente existentes no tabuleiro
*/
jogadasValidas(Tabuleiro,black,[FutureLine-FutureColumn]):- 
    jogadasPossiveis(Tabuleiro,black,[[Line-Column]|ListaTail]), %lista das pecas pretas
    ListaFinal = [[Line-Column]|ListaTail],
    verificacao(Tabuleiro,black,[[Line-Column]|ListaTail],ListaFinal,ListaFinalissima),
    write('ListaFinal'),
    write(ListaFinal),nl,
    write('ListaFinalissima'),
    write(ListaFinalissima).

    %seleccionarJogadaLista(Tabuleiro,black,[[Line-Column]|ListaTail],[FutureLine-FutureColumn]).    
    %percorer a lista e por cada elemento verificose ha jogada selecioanrBot,
    %seleccionarBotJogada(Tabuleiro, Line, Column, NewLineIndex, NewColumnIndex, Color)



%####################################################################### <end find all base
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
pecasPretasAjogar([[1-1],[1-3],[2-2],[2-4],[3-3],[5-1]]). 

%   6 pecas BRANCAS com os seus indices verifacaoJogadasPossiveis(Tabuleiro,white,[[Line-Column]|ListaTail])
myListaTeste([[1-2],[2-1],[3-0],[3-1],[4-1],[4-3]]).
%########################################################################################



/**
 * direccaoDaJogada(+Tabuleiro,+LinhaEColuna,-FuturaJogada, -ListaJogadasVizinhas)
 * @brief escolha a jogada seguinte do bot
 * @param +Tabuleiro: tabuleiro actual
 * @param +LinhaEColuna: celula vizinha
 * @param -FuturaJogada: jogada escolhida
 * @param -ListaJogadasVizinhas: jogadas possiveis na celula vizinha
 */
direccaoDaJogada(Tabuleiro,[Line-Column],FuturaJogada, ListaJogadasVizinhas):-
    findall([NewLineIndex-NewColumnIndex],checkarPecaVizinhaValiada( Line, Column, Color,[NewLineIndex-NewColumnIndex]), ListaJogadasVizinhas),
    seleccionarJogadaLista(Tabuleiro,Color,_Lista,FuturaJogada).
   
  %  !,
  %  confirmacaoPecaVizinha(Line,Column,Color), 
  %  confirmacaoPecaVizinha(Line,Column,Color),
  %  confirmacaoPecaVizinha(Line,Column,Color),
  %  confirmacaoPecaVizinha(Line1,Column,Color)
%defenir u, random de quatro valores ???
%fazer uma lista de valores ??


/**
 * jogarLeBot(+TabuleiroInicial, -TabuleiroFinal)
 * @brief Generates a random play for the bot without being clever - a black piece eats a white one
 * @param +TabuleiroInicial: tabuleiro actual
 * @param -TabuleiroFinal: tabuleiro futuro
*/
jogarLeBot(TabuleiroInicial, TabuleiroFinal):-
    jogadasValidas(TabuleiroInicial, black,[Line-Column]),
    direccaoDaJogada(TabuleiroInicial,[Line-Column],[NewLineIndex, NewColumnIndex], _ListaJogadasVizinhas),
    !,
    replaceInMatrix(TabuleiroInicial, NewLineIndex, NewColumnIndex, black, TabuleiroNovo),
    replaceInMatrix(TabuleiroNovo, Line, Column, empty, TabuleiroFinal),
    write('Jogou de '),
    write(_LineIndex), 
    write(' '),
    write(_ColumnIndex),
    write(' para '),
    write(NewLineIndex),
    write(' '),
    write(NewColumnIndex),
    write(' E acabou a jogada bot'). 
jogarLeBot(TabuleiroInicial, TabuleiroFinal):-
    choose_move(TabuleiroInicial, TabuleiroFinal).
























%####################################################################################################3

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
