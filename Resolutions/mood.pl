





























male('Aldo Burrows').
male('Lincoln Burrows').
male('Mich1ael Scofield').
male('LJ Burrows').
female('Christina Rose Scofield').
female('Lisa Rix').
female('Sara Tancredi').
female('Ella Scofield').
parent('Aldo Burrows', 'Lincoln Burrows').
parent('Aldo Burrows', 'Michael Scofield').
parent('Christina Rose Scofield', 'Lincoln Burrows').
parent('Christina Rose Scofield', 'Michael Scofield').
parent('Lisa Rix','LJ Burrows').
parent('Lincoln Burrows','LJ Burrows').
parent('Michael Scofield','Ella Scofield').
parent('Sara Tancredi','Ella Scofield').

ligacao(1, 2).
ligacao(1, 3).
ligacao(2, 4).
ligacao(3, 4).
ligacao(3,6).
ligacao(4, 6).
ligacao(5,6).
/**caminho(+NoInicio, +NoFim, -Lista)
*/
ligacao2(X,Y):- ligacao(X,Y).
ligacao2(X,Y):- ligacao(Y,X).

caminho(NoInicio, NoFim, Lista):- 
    caminho(NoInicio, NoFim, [NoInicio], Lista, 5).
caminho(NoInicio, NoFim, Lista, ListaFim, _):-
    ligacao2(NoInicio, NoFim),
    append(Lista, [NoFim], ListaFim).
caminho(NoInicio, NoFim, Lista, ListaFim, N):-
    N>0,
    ligacao2(NoInicio, NoInterm),
    NoInterm \= NoFim,
    \+(member(NoInterm, Lista)),
    append(Lista, [NoInterm], Lista2),
    N2 is N-1,
    caminho(NoInterm, NoFim, Lista2, ListaFim, N2).









% a)
% parent(X,'Michael Scofield'), parent(Y,'Michael Scofield'), X \= Y.

% b)
% parent('Aldo Burrows', X), parent('Aldo Burrows', Y), X \= Y.