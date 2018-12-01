% Factos
%      title    cat duration            avgClass
film('A', [action, adventure, fantasy], 115, 7.6).
film('B', [biography, drama, romance], 131, 8.7).
film('C', [action, adventure, crime], 121, 6.4).
film('D', [drama, mystery, scifi], 116, 8.5).
film('E', [action, crime, drama], 127, 7.6).
film('F', [drama, mystery, thriller], 112, 6.7).

% username yeraofbith countr
user(john, 1992, 'USA').
user(jack, 1989, 'UK').
user(peter, 1983, 'portugal').
user(harry, 1993, 'USA').
user(richard, 1982, 'USA').

%username , list of film rating 
vote(john, ['C'-7, 'A'-9, 'E'-6]).
vote(jack, ['C'-8, 'A'-8, 'E'-7]).
vote(peter, ['E'-4, 'B'-7, 'F'-3]).
vote(harry, ['C'-7, 'E'-6]).
vote(richard, ['C'-10, 'B'-10, 'D'-9]).

%append1([],X,X).
%append1([X|Xs],Y,[X|Zs]):- append1(Xs,Y,Zs).

l1([a,b,c]).
l2([a,b,d, d,a,b]).
%elemts([a,b,c],[a,b],[a,b,d]).


elemts([],[],_):-!.

elems(_, [], []) :- !.

elemts([H1|T1],New,Lista2):-
        %sort()
        member(H1,Lista2),!,
        
        elemts(T1,Lista1,Lista2),
        New = [H1|Lista1].

elemts([H1|T1],Lista1,Lista2):-        
        elemts(T1,Lista1,Lista2).

%%%%################################3
%#####################################




niceGuy(User):-
    vote(User, Lista),
    member(Movie1-Rating, Lista),
    member(Movie2-Rating, Lista),
    Rating >= 8,
    Movie1 \= Movie2.
   
diff(User1, User2, Difference, Movie):-
    vote(User1, Lista1),
    vote(User2, Lista2),
    member(Movie-Rating, Lista1),
    member(Movie-Rating2, Lista2),
    Difference is abs(Rating - Rating2).

curto(Movie):-  
    film(Movie,_,Durat,_),
    Durat < 125.