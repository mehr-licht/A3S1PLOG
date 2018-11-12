%Factos

film('A', [action, adventure, fantasy], 115, 7.6).
film('B', [biography, drama, romance], 131, 8.7).
film('C', [action, adventure, crime], 121, 6.4).
film('D', [drama, mystery, scifi], 116, 8.5).
film('E', [action, crime, drama], 127, 7.6).
film('F', [drama, mystery, thriller], 112, 6.7).

user(john, 1992, 'USA').
user(jack, 1989, 'UK').
user(peter, 1983, 'portugal').
user(harry, 1993, 'USA').
user(richard, 1982, 'USA').

vote(john, ['C'-7, 'A'-9, 'E'-6]).
vote(jack, ['C'-8, 'A'-8, 'E'-7]).
vote(peter, ['E'-4, 'B'-7, 'F'-3]).
vote(harry, ['C'-7, 'E'-6]).
vote(richard, ['C'-10, 'B'-10, 'D'-9]).

curto(X):- film(X,_ , Y, _), Y < 125.

getUserVote([],_,_).
getUserVote([Film-Rating|_], Movie, Vote):-
    Film == Movie,
    !,
    Vote is Rating.
getUserVote([_-Rating|RestFilms], Movie, Vote):- getUserVote(RestFilms, Movie,Vote).

%votos dos utilizadores USer1 and USer1 relativamente ao filme
diff(User1,User2, Differ,Film) :- 
    vote(User1, VotePoll_1),
    getUserVote(VotePoll_1,Film, Vote1),
    vote(User2, VotePoll_2),
    getUserVote(VotePoll_2,Film, Vote2),
    Differ is abs(Vote1 - Vote2).

%nota igual ou superior a 8 a pelo menos dois filmes diferetes.
getUserVote2([],0).
getUserVote2([Film-Rating|RestFilms], Vote1):-
    getUserVote2(RestFilms, Vote),
    Rating >= 8, %backtracking invertido, em suma, ele so soma depois no backtracking de volta
    !,
    Vote1 is Vote + 1.
getUserVote2([Film-Rating|RestFilms], Vote):-getUserVote2(RestFilms, Vote).
niceGuy(User):-
    vote(User, ListaVotos),
    getUserVote2(ListaVotos, Vote),
    Vote >= 2.

%###################################################################
listaUm([a,b,c,d,e,f]).
listaDois([g,h,j,a,b,g,f,t]).


%member1(X,[X|Ys]).
%member1(X,[Y|Ys]):- member1(X,Ys).

%elemsComuns([],[],_).
%elemsComuns(_,[],[]).
%elemsComuns([Elem1|List1], L, List2) :-
%  member1(Elem1,List2),
%  !,
%  NewL = [Elem1|L],
%  elemsComuns(List1, NewL, List2).
%elemsComuns([Elem1|List1], L, List2):-elemsComuns(List1, L, List2).

elemsComuns([],Common,[]).
elemsComuns([],Common,_).
elemsComuns([Lista1| Tail1], Common, Lista2):-
    elemsComuns(Tail1, Common, Lista2),
    memberchk(Lista1,Lista2),
    !,
    Common1 = [Lista1|Common],
    elemsComuns(Tail, Common1, Lista2).
%elemsComuns([Lista1| Tail1], Common, Lista2):-
    
%#####################################################################

printCategory(Category) :-
    film(Name, Categories, Time, Rating),
    memberchk(Category, Categories),
    write(Name), write(' ('), write(Time), write('min, '), write(Rating), write('/10)'), nl,
    fail.

%11similariedade = percentagemComoun-3*DurDiff-5*ScoreDiff

similarity(Film1, Film2, Similarity):-