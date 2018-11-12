
## Comecar o jogo 
Para jogar o jogo invocar:
                            ?:- reconsult(clobberInit).
                            ?:- play.
jogador 1 -> brancas
jogador 2 -> pretas

3.3 valid_moves(+tabuleiro, +jogador, jogada, novoTab, novoJogador). -ListofMoves jogadas possiveis
[IMPLEMENTADO]   3.4 move(+move,+board,-Newboard) - vaidacao e execucao de uma jogada
[IMPLEMENTADO]   3.5 game_over(+Board, -Winner) - mas nao descrito especificamente
3.6 value(+tab, +jogador, -val). - avaliacao do estado do jogo 
[IMPLEMTENTAD a 2/3 falta a escolha da difficuldade] 3.7 choose_move(+Board, +level, -Move)  - nivel de dificuldade
        depois eh so usar a random library
        findall(jog, validMove( tab, jogador, jogada, novoTabuleiro, novoJogador ), L).

        val_jog eh o valor da jogada avaliado o tabuleiro apos a jogada val_jog eh um termo composto val-jogada 
        setOf(val_jog, (validMove(tab, jpgador, jogada, novoTabuleiro, novoJogador), evalBoard(tab, jogador, val) ), L ).


para encontrar o caminho mais curto entre 2 nos
setOf(len-path, (path(start, end, path), length(path, len)), [slen-spath|_]).
*/


# Priority

Condicao de terminacao do jogo - quando nao ha jogadas validas
percorrer a matriz linha a linha e certificar que existe pelo menos uma jogada valida
se xiste um sequencia de white e black ou black white _> existe jogada


p vs bot
bot vs bot

bot - random lina e coluna dos indices ate verificacao de uma jogada valida.

# Secundary


### Testes efectuados

Validacao das jogadas finalizada
Confimar a diferenca entre o indice do jogador e da peca escolhida é 1. Se nao for a jogada eh invalida
Validar inputs de teclado fora da gama das linhas e colunas
Repete se as posicoes das pecas não correspoderem aos inputs
Lê os inputs de teclado da gama
Repete caso os inputs sejam errados
Faz o loop entre o jogador 1 e o jogador 2
