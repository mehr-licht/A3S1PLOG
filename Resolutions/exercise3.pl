
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


:- use_module(library(lists)).



%participant(Id,Age,Performance)
participant(1234, 17, 'Pé coxinho').
participant(3423, 21, 'Programar com os pés').
participant(3788, 20, 'Sing a Bit').
participant(4865, 22, 'Pontes de esparguete').
participant(8937, 19, 'Pontes de pen-drives').
participant(2564, 20, 'Moodle hack').

%performance(Id,Times)
performance(1234,[120,120,120,120]).
performance(3423,[32,120,45,120]).
performance(3788,[110,2,6,43]).
performance(4865,[120,120,110,120]).
performance(8937,[97,101,105,110]).

%Listade ids. 
 mylista([1234,3423,3788,4865,8937,2564]).
 mylista2( ['Pé coxinho','Programar com os pés','Sing a Bit','Pontes de esparguete','Pontes de pen-drives','Moodle hack']).
predX(_,[],[]).
predX(Q,[R|Rs],[P|Ps]) :-
        participant(R,Idade,P), Idade=<Q, !,
        predX(Q,Rs,Ps).
predX(Q,[R|Rs],Ps) :-
        participant(R,Idade,_), Idade>Q,
        predX(Q,Rs,Ps).



nSuccessfulParticipants(T):-
        setof(_Participant,(performance(Id,ListaTempos),noClick(ListaTempos)), Total),
        length(Total,T).
        

noClick([]).
noClick([Htempos|TailTempos]):-
        Htempos == 120,
        noClick(TailTempos).

carregou([]).
carregou([H|T]):-
        H == 120,
        !,
        carregou(T).
carregou([H|T]):-fail.        

%madeItThrough(+Participant),
madeItThrough(Part):-
        performance(Part,Lista),
        member(X,Lista),
        X = 120.

juriTimes([], _, [], 0).
juriTimes([H|T], JuriMember, [H1|T1], Total) :-
        juriTimes(T, JuriMember, T1, TotalAux),
        performance(H, TimesList),
        nth1(JuriMember, TimesList, H1),
        Total is (TotalAux + H1).                                
        
patientJuri(JuriMember) :-
        performance(X,ListaTempos),
        performance(Y,ListaTempos2),
        X \= Y,
        nth0(JuriMember, ListaTempos, Time),
        nth0(JuriMember, ListaTempos2, Time2),
        Time == 120,
        Time2 == 120.

sumalist([],0).        
sumalist([H|T], Total):-
        sumalist(T, TotalAux),
        Total is (TotalAux + H).        
        
bestParticipant(P1, P2, P) :-
        performance(P1, Times1),
        performance(P2, Times2),
        sumalist(Times1, Total1),
        sumalist(Times2, Total2),
        Total1 > Total2,
        P is P1.

bestParticipant(P1, P2, P) :-
        performance(P1, Times1),
        performance(P2, Times2),
        sumalist(Times1, Total1),
        sumalist(Times2, Total2),
        Total1 < Total2,
        P is P2.

allPerfs:-
        participant(Id, _, Nome),
        performance(Id,Tempos),
        write(Id), write(':'),
        write(Nome), write(':'),
        write(Tempos), nl,
        fail.
allPerfs.



