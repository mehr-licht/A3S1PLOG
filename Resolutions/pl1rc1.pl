:- use_module(library(lists)).


male('Aldo Burrows').
male('Lincoln Burrows').
male('Michael Scofield').
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
    caminho(NoInicio, NoFim, [NoInicio], Lista, 5). %caso base porque o comprimento maximo eh 5
caminho(NoInicio, NoFim, Lista, ListaFim, _):-
    ligacao2(NoInicio, NoFim),
    append(Lista, [NoFim], ListaFim).
caminho(NoInicio, NoFim, Lista, ListaFim, N):-
    N>0,
    ligacao2(NoInicio, NoInterm),
    NoInterm \= NoFim, % nao eh igual
    \+(member(NoInterm, Lista)), %trie if cannot be proven
    append(Lista, [NoInterm], Lista2),
    N2 is N-1,
    caminho(NoInterm, NoFim, Lista2, ListaFim, N2).

ciclos(No, Comp, Lista):-
    findall(Ciclo, caminho(No, No, [], Ciclo, Comp), Lista).


listaTeste([black,empty,black,empty,black,empty]).
%replaceInList([_H|T], 0, Value, [0|T]).
% funcao de chamada recursiva para percorrer a lsita
replaceInList([H|T], Value, [H|TNew]) :-
        nth0(IndexDev,[H|T],Value),
        !,
        replaceInList(T, Value, [H|IndexDev]).


%listaIndexes([]).
%listaFinal([]).
%#################################################

%getIndex(Tabuleiro, Color, ListaInicial, ListaFinal) :-
%    nth0(Indexes,Tabuleiro, Color),
%    !,
%    append([],Indexes, ListaFinal),
%    getIndex((Tabuleiro, Color, ListaFinal).

/*
getIndex(Lista, Index, black):-
    Index = 0.
getIndex(Lista, Index, black):-
*/


% a)
% parent(X,'Michael Scofield'), parent(Y,'Michael Scofield'), X \= Y.

% b)
% parent('Aldo Burrows', X), parent('Aldo Burrows', Y), X \= Y.