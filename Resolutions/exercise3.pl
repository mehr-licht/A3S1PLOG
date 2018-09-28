
lingua(portugues).
lingua(ingles).
livro('Os Maias').
autor('Eca Queiroz').
escreveu('Eca Queiroz','Os Maias').
escreveu('Julio Verne','Mil leguas').
tipo(romance).
tipo(ficcao).
class('Julio Verne',romance).
class('Eca Queiroz',romance).
nacionalidade('Eca Queiroz', portugues).

%livro(LivroEscrito):-escreveu(X,LivroEscrito).
%autor(Escritor):-escreveu(Escritor,Y).

%a
%escreveu(X,'Os Maias').
%b
%class(X,romance),escreveu(Y,romance).
%c - algo do genero não testado 
% class(Autores,romance), class(Autores,ficcao).
%escreveu(X,Y), class(X,romance), class(X,ficcao).

