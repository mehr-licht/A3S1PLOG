%livro(nome,qq).
livro('Os Maias', romance).
livro('Tragedia da Rua das Flores', romance).
%tipo(livro,tipo).
tipo('Os Maias',ficcao).
tipo('Tragedia da Rua das Flores',tragedia).
%escreveu(livro,autor)
escreveu('Os Maias', 'Eca de Queiroz').
escreveu('Tragedia da Rua das Flores', 'Eca de Queiroz').
nacionalidade('portugues').
nacionalidade('ingles').
%autor(nome,nacionalidade).
autor('Eca de Queiroz', 'portugues').
tipo(ficcao).

% a)
% escreveu('Os Maias',X)


% b)
% livro('Os Maias',romance),escreveu('Os Maias',Y),autor(Y,'portugues').

% c)
% autores de livros de ficcao que escreveram de outros tipos
% tipo(X,ficcao), escreveu(X,Y), tipo(Z,W), W\=ficcao, escreveu(Z,Y), Z \=X.
