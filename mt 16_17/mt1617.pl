
film('Doctor Strange', [action, adventure, fantasy], 115, 7.6).
film('Hacksaw Ridge', [biography, drama, romance], 131, 8.7).
film('Inferno', [action, adventure, crime], 121, 6.4).
film('Arrival', [drama, mystery, scifi], 116, 8.5).
film('The Accountant', [action, crime, drama], 127, 7.6).
film('The Girl on the Train', [drama, mystery, thriller], 112, 6.7).

user(john, 1992, 'USA').
user(jack, 1989, 'UK').
user(peter, 1983, 'portugal').
user(harry, 1993, 'USA').
user(richard, 1982, 'USA').

vote(john, ['Inferno'-7, 'Doctor Strange'-9, 'The Accountant'-6]).
vote(jack, ['Inferno'-8, 'Doctor Strange'-8, 'The Accountant'-7]).
vote(peter, ['The Accountant'-4, 'Hacksaw Ridge'-7, 'The Girl on the Train'-3]).
vote(harry, ['Inferno'-7, 'The Accountant'-6]).
vote(richard, ['Inferno'-10, 'Hacksaw Ridge'-10, 'Arrival'-9]).


%*******************************************************************#4
elemsComuns1(Lista1,Lista2,Saida):-
	myCommons(Lista1,Lista2,Saida).
myCommons([],_,[]).
myCommons([H1|T],Lista2,NewList):-
	member(H1,Lista2),
	\+member(H1,NewList),
	!,
	append(H1,Aux,Saida),
	myCommons(T,Lista2,Saida).
myCommons([H1|T],Lista2,NewList1):-
	myCommons(T,Lista2,NewList1).




%*******************************************************************

%vem da #6
similarity(Film1, Film2, Similarity) :-
  film(Film1, Categories1, Dur1, Scr1),
  film(Film2, Categories2, Dur2, Scr2),
  elemsComuns(Categories1, CategoriesDiff, Categories2),
  length(Categories1, Num1),
  length(Categories2, Num2),
  length(CategoriesDiff, NumDiff),
  Perc is (NumDiff / (Num2 + Num1 - NumDiff)) * 100,
  ite(Dur1 > Dur2, DurDiff is Dur1 - Dur2, DurDiff is Dur2 - Dur1),
  ite(Scr1 > Scr2, ScrDiff is Scr1 - Scr2, ScrDiff is Scr2 - Scr1),
  Similarity is Perc - 3*DurDiff - 5*ScrDiff.

elemsComuns([],[],_).
elemsComuns(_,[],[]).
elemsComuns([Elem1|List1], L, List2) :-
  elemsComuns(List1, NewL, List2),
  ite(member(Elem1,List2), L = [Elem1|NewL], L = NewL).


% Utils
ite(If, Then, _):- If, !, Then.
ite(_, _, Else):- Else.

it(If, Then):- If, !, Then.
it(_,_).
%***************************************************************#7
mostSimilar(Film, Similarity, Films) :-
setof(Film,(similarity(Film,Y,Similarity),film(Film,_,_,_),film(Y,_,_,_),Film\=Y,Similarity>10),Films).


%***************************************************************#8
%dist is AvgDiff + AgeDiff/3 + CountryDiff.
%distancia(User1, Distance, User2) :-


%media dif votos em filmes que ambos votaram
avgDiff(User1,User2,Value):-
	bagof(User1,vote(User1,ListaFilmes1),_Usuario1),
write(ListaFilmes1),nl,
	bagof(User2,vote(User2,ListaFilmes2),_Usuario2),
write(ListaFilmes2),nl,
	elemsComuns(ListaFilmes1,ListaFilmes2,ListaFilmes),
write(ListaFilmes),nl,
	Value is ListaFilmes.


ageDiff(User1,User2,Value):-
	user(User1,Ano1,_),
	user(User2,Ano2,_),
	Dif is Ano1-Ano2,
	Value is abs(Dif).
		

countryDiff(User1,User2,Value):-
	user(User1,_,Country1),
	user(User2,_,Country2),
	Country1 == Country2,!,
	Value is 0.
countryDiff(_User1,_User2,Value):-
	Value is 2.




inter([], _, []).
inter([H|T1], L2, L3) :-
        member(H, L2),
        !,
        L3 = [H|T3],
        intersection(T1, L2, T3).
inter([_|T1], L2, L3) :-
        inter(T1, L2, L3).
