% ------------------------------------------------------------------------------
% Base de Factos
:-use_module(library(lists)).
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


listi([97,101,105,110]).
lista([110,2,6,43]).
apend([X|[]],X).
apend([H|T],X):-apend(T,X).

myAppend(0, []).

myAppend(N, [N | L]) :-
  N > 0,
  N1 is N - 1,
  myAppend(N1, L).












replik(1,[],[]).






replik(N,[H|ListaPa], [H|NewLista]):-
    N > 1,
    New is (N - 1),
    replik(New,ListaPa,Newlista).
    

nextPhase(N, Pa):-  
     findall(TT-Id-Perf,eligibleOutcome(Id,Perf,TT),ListaPa).
    
    %replik(N, ListaPa, NewLista),
    %Pa = NewLista.



eligibleOutcome(Id,Perf,TT) :-
    performance(Id,Times),
    madeItThrough(Id),
    participant(Id,_,Perf),
    sumlist(Times,TT).



predX(Q,[RPartic|Rs],[P|Ps]) :-
    participant(RPartic,Idade,P), Idade=<Q, !,
    predX(Q,Rs,Ps).
predX(Q,[RPartic|Rs],Ps) :-
    participant(RPartic,Idade,_), Idade>Q,
    predX(Q,Rs,Ps).
predX(_,[],[]).



%performance(1243,[120,120,120,120]).
myList([97,101,105,110]).

getValue([H|_],1,H).
getValue([_|T],Juri,Value):-
    Juri > 1,
    NewJuri is Juri-1,
    getValue(T,NewJuri,Value).


patientJuriEXTRA(Juri):-
    performance(A,List),
    getValue(List,Juri,Value),
    Value =:= 120,
    performance(B,List2),
    B \=A,
    getValue(List2,Juri,Value2),
    Value2 =:= 120.
    

indexRec(Element,[Head|Tail],Actual,Index):-
    (Element =:= Head,
        Index is Actual)
    ;
    (Next is Actual + 1,
        indexRec(Element,Tail,Next,Index)).
 
index(Element,List,Index):-
    indexRec(Element,List,1,Index).
 
fans(X,Y):-
    performance(X,List),
    findall(Z,index(120,List,Z),NewList),
    Y = X-NewList.
impoe(X,L) :-
  length(Mid,X),
 append(L1,[X|_],L), append(_,[X|Mid],L1).



juriFans(JuriFansList):-
    findall(Y,(participant(X,_,_),fans(X,Y)),JuriFansList).
%########################################################
somaLista2([],0).
somaLista2([H|T], Total):-
    somaLista(T,TotalAux),
    Total is (TotalAux + H).

auxAll(Id):-
    performance(Id,ListaTempos),
    somaLista2(ListaTempos,Number),
    Number =:= 480.
    

nSuccessfulParticipants(T):-
    findall(Id,auxAll(Id),ListaDeParticipantes),
    length(ListaDeParticipantes,T).

allPerfs:-
    performance(Id,_, Nome),
    participant(Id,ListaTempos),
    write(Id),write(':'),
    write(Nome), write(':'),
    write(ListaTempos),nl,
    fail.
allPerfs.


getElement([Head|_],1,Head).
getElement([_|Tail],Index,Element):-
    Index > 1,
    Next is Index - 1,
    getElement(Tail,Next,Element).

:-dynamic patientJuri/1.

patientJuriRec(Juri):-
    performance(_,List),
    getElement(List,Juri,Element),
    Element =:= 120,
    patient(X),
    retract(patient(X)), % elimina a ultima clausula porque encontrou
    Next is X + 1,
    assert(patient(Next)), % adiciona a clausula  NEXT
    fail. %fail para estar a fazer a mesma funcao em todos os factos
 
patientJuri(Juri):-
    assert( patient(0) ), %contador iniciar a zero MANDA facto
    ( patientJuriRec(Juri) ) %chama a funcao
            ;
    (patient(X),retract(patient(_)),
    X >= 2).    

patientJuri2(Juri):-
    performance(X,Lista1),
    performance(Y,Lista2),
    getElement(Lista1,Juri,120),
    getElement(Lista2,Juri,120),
    member(120,Lista1),
    member(120,Lista2),
    X \= Y.



somaLista([],0).
somaLista([H|T], Total):-
    somaLista(T,TotalAux),
    Total is (TotalAux + H).



bestParticipant(P1, P2, P):-
    performance(P1,ListaTemposP1),
    performance(P2,ListaTemposP2),
    somaLista(ListaTemposP1,TotalP1),
    somaLista(ListaTemposP2,TotalP2),
     (   ( TotalP1 > TotalP2, P = P1 );
         (TotalP2 > TotalP1, P = P2 ) ),
    !.
bestParticipant(_, _, _):- fail.

    

somatorio([],0).
somatorio([Head|T],NewTotal):-
    somatorio(T, Total),
    NewTotal is (Total + Head).



madeItThrough(Id):-
    %participant(Id,_,_),
    performance(Id,Y),
    memberchk(120, Y).

%| ?- juriTimes([1234,3423,3788,4865,8937],1,Times,Total).
%Times = [120,32,110,120,97],
%Total = 479

somaAux([H|_],1,H,H).
somaAux([_|T], Juri, TempoParticipante,TempoPessoal):-
        NewJuri is (Juri - 1),
        somaAux(T, NewJuri,TempoParticipante,TempoPessoal).

juriTimes([],_,[],0).
juriTimes([Hpartic|Tpartic], Juri, [TempoPessoal|ListaTempos], Total):- %Njuri int 1 ou 2 ou 3
    juriTimes(Tpartic, Juri,ListaTempos, TotalAux),
    performance(Hpartic,ListaTemposP),
    somaAux(ListaTemposP, Juri, TempoParticipante,TempoPessoal),
    Total is (TotalAux + TempoParticipante).