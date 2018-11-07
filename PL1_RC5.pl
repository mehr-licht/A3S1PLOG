homem('Joao').
mulher('Ana').
mulher('Maria').
animal(cao).
animal(gato).
animal(tigre).
jogo(xadrez).
jogo(damas).
desporto(tenis).
desporto(natacao).
gosta_de('Joao', cao).
gosta_de('Ana', cao).
gosta_de('Ana', gato).
gosta_de('Maria', tigre).
gosta_de('Joao',tenis).
gosta_de('Maria',natacao).
gosta_de('Maria',damas).
gosta_de('Ana',xadrez).
mora_em('Maria',apartamento).
mora_em('Joao',apartamento).
mora_em('Ana',casa).


% a) Quem mora num apartamento e gosta de animais?
% mora_em(X,apartamento),gosta_de(X,Y),animal(Y).

% b) Será que o João e a Maria moram numa casa e gostam de desportos?
% mora_em('Joao',casa),mora_em('Maria',casa),gosta_de('Joao',Y),gosta_de('Maria',X),animal(Y),animal(X).

% c) Quem gosta de jogos e de desportos?
% gosta_de(X,Y),desporto(Y),gosta_de(X,Z),jogo(Z).


% d) Existe alguma mulher que gosta de ténis e gosta de tigres? 
% mulher(X),gosta_de(X,tenis),gosta_de(X,tigre).