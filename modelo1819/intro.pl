	%No concurso FEUPGotTalent, cada estudante pode participar mostrando as suas habilidades num qualquer tema, académico ou extra-curricular.
%Os interessados inscrevem-se, dando o número de estudante, idade e o nome da sua atuação:
%participant(Id,Age,Performance)
participant(1234, 17, 'Pé coxinho').
participant(3423, 21, 'Programar com os pés').
participant(3788, 20, 'Sing a Bit').
participant(4865, 22, 'Pontes de esparguete').
participant(8937, 19, 'Pontes de pen-drives').
participant(2564, 20, 'Moodle hack').


%As atuações são apreciadas por um júri de E elementos.
%Ao longo da atuação (que tem um máximo de 120 segundos), se um elemento do júri achar que o participante não deve passar à próxima fase,
%carrega num botão. Ficam registados os tempos em que cada elemento do júri carregou no botão. Se não carregou, ficam registados 120 segundos.
%performance(Id,Times)
performance(1234,[120,120,120,120]).
performance(3423,[32,120,45,120]).
performance(3788,[110,2,6,43]).
performance(4865,[120,120,110,120]).
performance(8937,[97,101,105,110]).

%*****************************************************************  #1

%madeItThrough(+Participant)
madeItThrough(Participant):-
	participant(Participant, _, _),
	performance(Participant, Lista),
	member(120, Lista).


%*****************************************************************  #2


%getElem(Indice,Lista,Aux)
getElem(Indice,Lista,Out):-
	getElem(Indice,Lista,1,Out).
getElem(_,[],_,Out).
getElem(Indice,[Hl|Tl],Aux,Out):-
	Aux==Indice,
	Out is Hl.
getElem(Indice,[Hl|Tl],Aux,Out):-
	Next is Aux +1,
	getElem(Indice,Tl,Next,Out).

	
%juriTimes(+Participants, +JuriMember, -Times, -Total)
juriTimes(Participants, JuriMember, Times, Total):-
	loop(Participants, JuriMember, [], Times),
	my_sumlist(Times,Total).

loop([],_,_).
loop([Hp|Tp],JuriMember, Times,Saida):-
	performance(Hp,ListaJurados),
	getElem(JuriMember,ListaJurados,Out),
	append([Out],Times, NewTimes),
	loop(Tp,JuriMember,NewTimes,NewTimes).
loop([Hp|Tp],JuriMember, Times,Saida):-
	loop(Tp,JuriMember,NewTimes,NewTimes).
	
my_sumlist([], 0).
my_sumlist([H|T], Sum) :-
   my_sumlist(T, Rest),
   Sum is H + Rest.




%*****************************************************************  #3

%patientJuri(+JuriMember)
patientJuri(JuriMember):-
	performance(A,Lista),	
	getElem(JuriMember,Lista,Value),
	Value == 120,
	performance(B,Lista2),	
	A \= B,
	getElem(JuriMember,Lista2,Value2),
	Value2 == 120,
	true.


%*****************************************************************  #4
%bestParticipant(3423,1234,Z).
bestParticipant(A,B,Z):-
	performance(A,ListaA),
	my_sumlist(ListaA,SomaA),
	performance(B,ListaB),
	my_sumlist(ListaB,SomaB),
	((SomaA>SomaB, Z is A);(SomaB>SomaA,Z is B)).


%*****************************************************************  #5

allPerfs:-
	imprime([]).

imprime(Aux):-
	performance(A,Lista),
	participant(A,_,Prova),
	\+ member(A,Aux),
	write(A),write(':'),write(Prova),write(':'),write(Lista),nl,
	append(A,Aux,Aux2),
	imprime(Aux2).
	

%*****************************************************************  #6
%nSuccessfulParticipants(-T)
nSuccessfulParticipants(T):-
	performance(X,ListaJuris),
	length(ListaJuris,NoJuris),
 	findall(X,(performance(X,LISTA),member(120,LISTA)),Saida),
	length(Saida,NoAteFim),
	NoJuris =:= NoAteFim,
	setof(Y,member(Y,Saida),NovaSaida),
 	length(NovaSaida,T).

	
%*****************************************************************  #7
%Implemente o predicado juriFans(juriFansList), que obtém uma lista contendo, para cada participante, 
%a lista dos elementos do júri que não carregaram no botão ao longo da sua atuação
%juriFans(juriFansList)

juriFans(JuriFansList):-
    findall(Y,(participant(X,_,_),juriFans2(X,Y)),JuriFansList).%faz findall de cada participante com (findall de cada juri do participante)

juriFans2(X,Y):-
	performance(X,ListaJuris),
	length(ListaJuris,NoJuris),
 	findall(X,(performance(X,LISTA),member(120,LISTA)),Out),
	Y=X-Out.

%*****************************************************************  #8
:- use_module(library(lists)).

eligibleOutcome(Id,Perf,TT) :-
    performance(Id,Times),
    madeItThrough(Id),
    participant(Id,_,Perf),
    sumlist(Times,TT).

nextPhase(Int,Parts):-
	nextAux(Int,[],Parts).
nextAux(Int,Aux,Parts1):-
	findall(P,(participant(P,Perf,_)),_Saida),%fico com P e Perf
	setof(TT,eligibleOutcome(P,Perf,TT),Out),%fico com TT
	length(Out,Tamanho),
	Tamanho =:= Int,!.
	%append( , ,Parts1).
	%nextAux(Int.

nextAux(Int,P):-
	fail.








%***************************************************************** #9
predX(Q,[Head_Id_Participante|Tail_Id_Participantes],[Head_Song|Tail_Song]) :-
write(' - 00 - '),nl,
    participant(Head_Id_Participante,Idade,Head_Song), 
write(Head_Id_Participante),write(' - 01 - '),write(Idade),nl,
Idade=<Q,
write(Head_Id_Participante),write(' - 02 - '),write(Idade),nl,
 !,
write(Head_Id_Participante),write(' - 03 - '),write(Idade),nl,
    predX(Q,Tail_Id_Participantes,Tail_Song).
predX(Q,[Head_Id_Participante|Tail_Id_Participantes],Ps) :-
write(' - 10 - '),nl,
    participant(Head_Id_Participante,Idade,_), Idade>Q,
write(Head_Id_Participante),write(' - 11 - '),write(Idade),nl,
    predX(Q,Tail_Id_Participantes,Ps).
predX(_,[],[]).





