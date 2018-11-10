passaro(tweety).
peixe(goldie).
minhoca(molie).
gosta_de(X,Y):- passaro(X),minhoca(Y).
gosta_de(X,Y):- gato(X),peixe(Y).
gosta_de(X,Y):- gato(X),passaro(Y).
gosta_de(X,Y):- amigo_de(X,Y),X\=Y.
amigo_de(X,Y):-  pertenca(gato(X),Y) , Y=eu.
gato(sylvester).
pertenca(sylvester,eu).
come(X,Y):- gosta_de(pertenca(gato(X),eu),Y).


% a) Use Prolog para determinar tudo o que come o Silvester?

% b) A resposta é razoável ? Se não for, verifique se o problema está na especificação original ou na sua tradução para Prolog, corrija e execute novamente. 
% original. tem de diferenciar gostar e gostar de comer. ou pessoas nao podem ser comidas ou 