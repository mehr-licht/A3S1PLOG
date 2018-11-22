:-use_module(library(lists)).
%:-dynamic played/4.
teste([1,2,3,4,5,6]).
%player(Name, UserName, Age).
player('Danny', 'Best Player Ever', 27).
player('Annie', 'Worst Player Ever', 24).
player('Harry', 'A-Star Player', 26).
player('Manny', 'The Player', 14).
player('Jonny', 'A Player', 16).

%game(Name, Categories, MinAge).
game('5 ATG', [action, adventure, open-world, multiplayer], 18).
game('Carrier Shift: Game Over', [action, fps, multiplayer, shooter], 16
).
game('Duas Botas', [action, free, strategy, moba], 12).

%played(Player, Game, HoursPlayed, PercentUnlocked)
played('Best Player Ever', '5 ATG', 3, 83).
played('Worst Player Ever', '5 ATG', 52, 9).
played('The Player', 'Carrier Shift: Game Over', 44, 22).
played('A Player', 'Carrier Shift: Game Over', 48, 24).
played('A-Star Player', 'Duas Botas', 37, 16).
played('Best Player Ever', 'Duas Botas', 33, 22).

whatDoesItDo(Acron):-
    player(Name, Acron, Age), !, 
    \+ ( played(Acron, NomdeJogo, Hours, Perc), game(NomdeJogo, ListaCatg, MinAge), MinAge > Age ).                              
%verifica se existem outros jogos existentes que ainda nao jogou e que sao indicados para a sua idade


mostEffectivePlayers(Game, Players):-
    findall(Ratio, ( played(Player,Game,Hours,Perc), Ratio is (Perc / Hours) ),Lista ),
    max_member( Max,Lista),
    findall(Player2,(played(Player2,Game,Hours2,Perc2), Ratio2 is (Perc2 / Hours2), Max == Ratio2),Players).

%mostEffectivePlayers(Game, Players) :-
%    findall(Ratio, (played(Player, Game, HoursPlayed, PercentUnlocked), Ratio is
%    PercentUnlocked / HoursPlayed) , List),
%    max_member(Max, List),
%    findall(Player2, (played(Player2, Game, HoursPlayed2, PercentUnlocked2), Ratio2 is
%    PercentUnlocked2 / HoursPlayed2, Ratio2 == Max) , Players).







averageAge(Game, AverageAge):-
    findall(Age ,(played(Nome,Game,_,_), player(_,Nome, Age)),ListaAge),
    length(ListaAge,Size),
    sumlist(ListaAge, Total),
    AverageAge is (Total / Size).
    
 
ageRange(MinAge, MaxAge, Players):-
    findall(Name,(player(Name,_Age), MinAge =< Age , Age =< MaxAge), Players).

%Questao 6 -             %acron         %Lista
%littleAchievement(Player, ListaGames):-
%    litteAux(ListaGames,Perc),
%    played(Player, Game, _, Perc),
%    Perc < 20


updatePlayer(Player, Game, Hours, Percentage):-
    played(Player,Game, OldHours, OldPerc),
    NewHours is (OldHours + Hours),
    NewPerc is (OldPerc + Percentage),
    retract(played(Player,Game, OldHours, OldPerc)),
    assert(played(Player,Game,NewHours,NewPerc)).
    



listGamesOfCategory(Cat):-
    game(Game,ListaCat, MinAge),
    member(Cat, ListaCat),
    write(Game), write(' ('),write(MinAge),write(')'),nl,fail.

listGamesOfCategory(_).
    



%como eh que ele poe o zero?
timePlayingGames(_,[],[],0). 
                  %alcunha       %Lista deGames
timePlayingGames(Player, [ListaGames|T], [HoursAdd |ListOfTimes ], Total):-
    played(Player,Game,Hours,_),
    timePlayingGames(Player, T, ListOfTimes, SumTimes ),
    ListaGames ==  Game,
    !,
    HoursAdd is Hours,
    Total is (SumTimes + Hours).
    


isAgeAppropriate(Name, Game):-
    game(Game,_,Idade),
    player(Name,_, Age),
    Idade < Age.

achievedLittle(Player):-
    played(Player,_,_,Perc),
    Perc < 10.

