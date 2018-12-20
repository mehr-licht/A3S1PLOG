:- use_module(library(lists)).
:- use_module(library(clpfd)).



run:-
    statistics(runtime, [T0|_]),
    testUnitarioV20(Vars),
    fd_statistics(backtracks,Value),
    
    statistics(runtime, [T1|_]),
    
    T is T1 - T0,nl,
    printLineAux(Vars),    
    write('Puzzle solved in: '),write(T),write('ms'),nl,
    write('backtracks: '),
    write(Value).

printLineAux([]).
printLineAux([Head|Tail]) :-
    write(Head),
    write(' | '),
    printLineAux(Tail).


testUnitarioV20(Vars):-
    Vars = [N1,N2,N3,N4,N5,E1,E2,E3,E4,E5,S1,S2,S3,S4,S5,W1,W2,W3,W4,W5], %
    ValorCelula1 #= 2, ValorCelula2 #= 4, ValorCelula3 #= 2, ValorCelula4 #= 2, ValorCelula5 #= 1,               %
    ValorCelula6 #= 3, ValorCelula7 #= 1, ValorCelula8 #= 2, ValorCelula9 #= 1, ValorCelula10 #= 3,  %
    ValorCelula11 #= 2, ValorCelula12 #= 1, ValorCelula13 #= 1, ValorCelula14 #= 2,ValorCelula15 #= 1, %
    ValorCelula16 #= 3, ValorCelula17 #= 1, ValorCelula18 #= 0, ValorCelula19 #= 1,ValorCelula20 #= 2, %
    ValorCelula21 #= 3, ValorCelula22 #= 2, ValorCelula23 #= 1, ValorCelula24 #= 3, ValorCelula25 #= 2,  %%%%%
    Dist5 #= 5,
    Dist4 #= 4,
    Dist3 #= 3,
    Dist2 #= 2,     %            
    Dist1 #= 1,    %
    domain(Vars,0,5),
    calc01(N1,N2,E1,S5,W4,W5, Dist1, Dist5, ValorCelula1),  
    calc02(N1,N2,N3,E1,E5,S4,W3,W5,Dist1,Dist2,Dist4, Dist5, ValorCelula2),  
    calc03(N2,N3,N4,E1,E4,S3,W2,W5, Dist1,Dist3,Dist5, ValorCelula3),  
    calc04(N3,N4,N5,E1,E3,S2,W1,W5, Dist1,Dist2,Dist4,Dist5, ValorCelula4),  
    calc05(N4,N5,E1,E2,S1,W5, Dist1,Dist5, ValorCelula5),   
    calc06(N1,N3,E2,S1,S5,W3,W4,W5, Dist1,Dist2,Dist5, ValorCelula6), 
    calc07(N2,N4,E2,S4,W2,W4, Dist2, Dist4, ValorCelula7), 
    calc08(N1,N3,N5,E2,E5,S3,W1,W4, Dist2, Dist3, Dist4, ValorCelula8),  
    calc09(N2,N4,E2,E4,S2,W4, Dist2, Dist4, ValorCelula9),  
    calc010(N3,N5,E1,E2,E3,S1,S5,W4, Dist1, Dist2, Dist4, Dist5, ValorCelula10),  
    calc011(N1,N4,E3,S2,S5,W2,W3,W4, Dist1, Dist3, Dist5, ValorCelula11), 
    calc012(N2,N5,E3,S1,S4,W1,W3,W5, Dist2, Dist3, Dist4, ValorCelula12), 
    calc013(N3,E3,S3,W3, Dist3, ValorCelula13), 
    calc014(N1,N4,E1,E3,E5,S2,S5,W3, Dist2, Dist3, Dist4, ValorCelula14),  
    calc015(N2,N5,E2,E3,E4,S1,S4,W3, Dist1, Dist3, Dist5, ValorCelula15),  
    calc016(N1,N5,E4,S3,S5,W1,W2,W3, Dist1, Dist2, Dist4, Dist5, ValorCelula16),  
    calc017(N2,E4,S2,S4,W2,W4, Dist2, Dist4, ValorCelula17),  
    calc018(N3,E1,E4,S1,S3,S5,W2,W5, Dist2, Dist3, Dist4, ValorCelula18), 
    calc019(N4,E2,E4,S2,S4,W2, Dist2, Dist4, ValorCelula19),  
    calc020(N1,N5,E3,E4,E5,S1,S3,W2, Dist1, Dist2, Dist4, Dist5, ValorCelula20),  
    calc021(N1,E5,S4,S5,W1,W2, Dist1, Dist5, ValorCelula21),  
    calc022(N2,E1,E5,S3,S4,S5,W1,W3, Dist1, Dist2, Dist4, Dist5, ValorCelula22), 
    calc023(N3,E2,E5,S2,S3,S4,W1,W4, Dist1, Dist3, Dist5, ValorCelula23),  
    calc024(N4,E3,E5,S1,S2,S3,W1,W5, Dist1, Dist2, Dist4, Dist5, ValorCelula24),  
    calc025(N5,E4,E5,S1,S2,W1, Dist1, Dist5, ValorCelula25),    
    labeling([],Vars).

calc025(N5,E4,E5,S1,S2,W1, Dist1, Dist5, ValorCelula25):-
    (Dist5 #=< N5) #<=> B1,
    (Dist1 #=< E4) #<=> B2,
    (Dist1 #=< E5) #<=> B3,
    (Dist1 #=< S1) #<=> B4,
    (Dist1 #=< S2) #<=> B5,
    (Dist5 #=< W1) #<=> B6,
    ValorCelula25 #= B1 + B2 + B3 + B4 + B5 + B6.
calc024(N4,E3,E5,S1,S2,S3,W1,W5, Dist1, Dist2, Dist4, Dist5, ValorCelula24):-
    (Dist5 #=< N4) #<=> B1,
    (Dist2 #=< E3) #<=> B2,
    (Dist2 #=< E5) #<=> B3,
    (Dist1 #=< S1) #<=> B4,
    (Dist1 #=< S2) #<=> B5,
    (Dist1 #=< S3) #<=> B6,
    (Dist4 #=< W1) #<=> B7,
    (Dist4 #=< W5) #<=> B8,
    ValorCelula24 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc023(N3,E2,E5,S2,S3,S4,W1,W4, Dist1, Dist3, Dist5, ValorCelula23):-  
    (Dist5 #=< N3) #<=> B1,
    (Dist3 #=< E2) #<=> B2,
    (Dist3 #=< E5) #<=> B3,
    (Dist1 #=< S2) #<=> B4,
    (Dist1 #=< S3) #<=> B5,
    (Dist1 #=< S4) #<=> B6,
    (Dist3 #=< W1) #<=> B7,
    (Dist3 #=< W4) #<=> B8,
    ValorCelula23 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc022(N2,E1,E5,S3,S4,S5,W1,W3, Dist1, Dist2, Dist4, Dist5, ValorCelula22):- 
    (Dist5 #=< N2) #<=> B1,
    (Dist4 #=< E1) #<=> B2,
    (Dist4 #=< E5) #<=> B3,
    (Dist1 #=< S3) #<=> B4,
    (Dist1 #=< S4) #<=> B5,
    (Dist1 #=< S5) #<=> B6,
    (Dist2 #=< W1) #<=> B7,
    (Dist2 #=< W3) #<=> B8,
    ValorCelula22 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc021(N1,E5,S4,S5,W1,W2, Dist1, Dist5, ValorCelula21):-
    (Dist5 #=< N1) #<=> B1,
    (Dist5 #=< E5) #<=> B2,
    (Dist1 #=< S4) #<=> B3,
    (Dist1 #=< S5) #<=> B4,
    (Dist1 #=< W1) #<=> B5,
    (Dist1 #=< W2) #<=> B6,
    ValorCelula21 #= B1 + B2 + B3 + B4 + B5 + B6.
calc020(N1,N5,E3,E4,E5,S1,S3,W2, Dist1, Dist2, Dist4, Dist5, ValorCelula20):-  
    (Dist4 #=< N1) #<=> B1,
    (Dist4 #=< N5) #<=> B2,
    (Dist1 #=< E3) #<=> B3,
    (Dist1 #=< E4) #<=> B4,
    (Dist1 #=< E5) #<=> B5,
    (Dist2 #=< S1) #<=> B6,
    (Dist2 #=< S3) #<=> B7,
    (Dist5 #=< W2) #<=> B8,
    ValorCelula20 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc019(N4,E2,E4,S2,S4,W2, Dist2, Dist4, ValorCelula19):-  
    (Dist4 #=< N4) #<=> B1,
    (Dist2 #=< E2) #<=> B2,
    (Dist2 #=< E4) #<=> B3,
    (Dist2 #=< S2) #<=> B4,
    (Dist2 #=< S4) #<=> B5,
    (Dist4 #=< W2) #<=> B6,
    ValorCelula19 #= B1 + B2 + B3 + B4 + B5 + B6.
calc018(N3,E1,E4,S1,S3,S5,W2,W5, Dist2, Dist3, Dist4, ValorCelula18):- 
    (Dist4 #=< N3) #<=> B1,
    (Dist3 #=< E1) #<=> B2,
    (Dist3 #=< E4) #<=> B3,
    (Dist2 #=< S1) #<=> B4,
    (Dist2 #=< S3) #<=> B5,
    (Dist2 #=< S5) #<=> B6,
    (Dist3 #=< W2) #<=> B7,
    (Dist3 #=< W5) #<=> B8,
    ValorCelula18 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc017(N2,E4,S2,S4,W2,W4, Dist2, Dist4, ValorCelula17):-
    (Dist4 #=< N2) #<=> B1,
    (Dist4 #=< E4) #<=> B2,
    (Dist2 #=< S2) #<=> B3,
    (Dist2 #=< S4) #<=> B4,
    (Dist2 #=< W2) #<=> B5,
    (Dist2 #=< W4) #<=> B6,
    ValorCelula17 #= B1 + B2 + B3 + B4 + B5 + B6. 
calc016(N1,N5,E4,S3,S5,W1,W2,W3, Dist1, Dist2, Dist4, Dist5, ValorCelula16):-
    (Dist4 #=< N1) #<=> B1,
    (Dist4 #=< N5) #<=> B2,
    (Dist5 #=< E4) #<=> B3,
    (Dist2 #=< S3) #<=> B4,
    (Dist2 #=< S5) #<=> B5,
    (Dist1 #=< W1) #<=> B6,
    (Dist1 #=< W2) #<=> B7,
    (Dist1 #=< W3) #<=> B8,
    ValorCelula16 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc015(N2,N5,E2,E3,E4,S1,S4,W3, Dist1, Dist3, Dist5, ValorCelula15):-  
    (Dist3 #=< N2) #<=> B1,
    (Dist3 #=< N5) #<=> B2,
    (Dist1 #=< E2) #<=> B3,
    (Dist1 #=< E3) #<=> B4,
    (Dist1 #=< E4) #<=> B5,
    (Dist3 #=< S1) #<=> B6,
    (Dist3 #=< S4) #<=> B7,
    (Dist5 #=< W3) #<=> B8,
    ValorCelula15 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc014(N1,N4,E1,E3,E5,S2,S5,W3, Dist2, Dist3, Dist4, ValorCelula14):-
    (Dist3 #=< N1) #<=> B1,
    (Dist3 #=< N4) #<=> B2,
    (Dist2 #=< E1) #<=> B3,
    (Dist2 #=< E3) #<=> B4,
    (Dist2 #=< E5) #<=> B5,
    (Dist3 #=< S2) #<=> B6,
    (Dist3 #=< S5) #<=> B7,
    (Dist4 #=< W3) #<=> B8,
    ValorCelula14 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc013(N3,E3,S3,W3, Dist3, ValorCelula13):-
    (Dist3 #=< N3) #<=> B1,
    (Dist3 #=< E3) #<=> B2,
    (Dist3 #=< S3) #<=> B3,
    (Dist3 #=< W3) #<=> B4,
    ValorCelula13 #= B1 + B2 + B3 + B4.
calc012(N2,N5,E3,S1,S4,W1,W3,W5, Dist2, Dist3, Dist4, ValorCelula12):-
    (Dist3 #=< N2) #<=> B1,
    (Dist3 #=< N5) #<=> B2,
    (Dist4 #=< E3) #<=> B3,
    (Dist3 #=< S1) #<=> B4,
    (Dist3 #=< S4) #<=> B5,
    (Dist2 #=< W1) #<=> B6,
    (Dist2 #=< W3) #<=> B7,
    (Dist2 #=< W5) #<=> B8,
    ValorCelula12 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.    
calc011(N1,N4,E3,S2,S5,W2,W3,W4,Dist1, Dist3, Dist5, ValorCelula11):- 
    (Dist3 #=< N1) #<=> B1,
    (Dist3 #=< N4) #<=> B2,
    (Dist5 #=< E3) #<=> B3,
    (Dist3 #=< S2) #<=> B4,
    (Dist3 #=< S5) #<=> B5,
    (Dist1 #=< W2) #<=> B6,
    (Dist1 #=< W3) #<=> B7,
    (Dist1 #=< W4) #<=> B8,
    ValorCelula11 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc010(N3,N5,E1,E2,E3,S1,S5,W4, Dist1, Dist2, Dist4, Dist5, ValorCelula10):-
    (Dist2 #=< N3) #<=> B1,
    (Dist2 #=< N5) #<=> B2,
    (Dist1 #=< E1) #<=> B3,
    (Dist1 #=< E2) #<=> B4,
    (Dist1 #=< E3) #<=> B5,
    (Dist4 #=< S1) #<=> B6,
    (Dist4 #=< S5) #<=> B7,
    (Dist5 #=< W4) #<=> B8,
    ValorCelula10 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc09(N2,N4,E2,E4,S2,W4, Dist2, Dist4, ValorCelula9):-  
    (Dist2 #=< N2) #<=> B1,
    (Dist2 #=< N4) #<=> B2,
    (Dist2 #=< E2) #<=> B3,
    (Dist2 #=< E4) #<=> B4,
    (Dist4 #=< S2) #<=> B5,
    (Dist4 #=< W4) #<=> B6,
    ValorCelula9 #= B1 + B2 + B3 + B4 + B5 + B6.
calc08(N1,N3,N5,E2,E5,S3,W1,W4, Dist2,Dist3,Dist4, ValorCelula8):-  
    (Dist2 #=< N1) #<=> B1,
    (Dist2 #=< N3) #<=> B2,
    (Dist2 #=< N5) #<=> B3,
    (Dist3 #=< E2) #<=> B4,
    (Dist3 #=< E5) #<=> B5,
    (Dist4 #=< S3) #<=> B6,
    (Dist3 #=< W1) #<=> B7,
    (Dist3 #=< W4) #<=> B8,
    ValorCelula8 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc07(N2,N4,E2,S4,W2,W4, Dist2, Dist4, ValorCelula7):-
    (Dist2 #=< N2) #<=> B1,
    (Dist2 #=< N4) #<=> B2,
    (Dist4 #=< E2) #<=> B3,
    (Dist4 #=< S4) #<=> B4,
    (Dist2 #=< W2) #<=> B5,
    (Dist2 #=< W4) #<=> B6,
    ValorCelula7 #= B1 + B2 + B3 + B4 + B5 + B6.   
calc06(N1,N3,E2,S1,S5,W3,W4,W5, Dist1,Dist2,Dist5, ValorCelula6):-
    (Dist2 #=< N1) #<=> B1,
    (Dist2 #=< N3) #<=> B2,
    (Dist5 #=< E2) #<=> B3,
    (Dist4 #=< S1) #<=> B4,
    (Dist4 #=< S5) #<=> B5,
    (Dist1 #=< W3) #<=> B6,
    (Dist1 #=< W4) #<=> B7,
    (Dist1 #=< W5) #<=> B8,
    ValorCelula6 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc05(N4,N5,E1,E2,S1,W5, Dist1,Dist5, ValorCelula5):-
    (Dist1 #=< N4) #<=> B1,
    (Dist1 #=< N5) #<=> B2,
    (Dist1 #=< E1) #<=> B3,
    (Dist1 #=< E2) #<=> B4,
    (Dist5 #=< S1) #<=> B5,
    (Dist5 #=< W5) #<=> B6,
    ValorCelula5 #= B1 + B2 + B3 + B4 + B5 + B6.
calc04(N3,N4,N5,E1,E3,S2,W1,W5,Dist1,Dist2,Dist4,Dist5,ValorCelula4):-    
    (Dist1 #=< N3) #<=> B1,
    (Dist1 #=< N4) #<=> B2,
    (Dist1 #=< N5) #<=> B3,
    (Dist2 #=< E1) #<=> B4,
    (Dist2 #=< E3) #<=> B5,
    (Dist5 #=< S2) #<=> B6,
    (Dist4 #=< W1) #<=> B7,
    (Dist4 #=< W5) #<=> B8,
    ValorCelula4 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc03(N2,N3,N4,E1,E4,S3,W2,W5, Dist1,Dist3,Dist5, ValorCelula3):-
    (Dist1 #=< N2) #<=> B1,
    (Dist1 #=< N3) #<=> B2,
    (Dist1 #=< N4) #<=> B3,
    (Dist3 #=< E1) #<=> B4,
    (Dist3 #=< E4) #<=> B5,
    (Dist5 #=< S3) #<=> B6,
    (Dist3 #=< W2) #<=> B7,
    (Dist3 #=< W5) #<=> B8,
    ValorCelula3 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc02(N1,N2,N3,E1,E5,S4,W3,W5, Dist1,Dist2,Dist4, Dist5, ValorCelula2):-  
    (Dist1 #=< N1) #<=> B1,
    (Dist1 #=< N2) #<=> B2,
    (Dist1 #=< N3) #<=> B3,
    (Dist4 #=< E1) #<=> B4,
    (Dist4 #=< E5) #<=> B5,
    (Dist5 #=< S4) #<=> B6,
    (Dist2 #=< W3) #<=> B7,
    (Dist2 #=< W5) #<=> B8, 
    ValorCelula2 #= B1 + B2 + B3 + B4 + B5 + B6 +B7+ B8.
calc01(N1,N2,E1,S5,W4,W5, Dist1, Dist5, ValorCelula1):-  
    (Dist1 #=< N1) #<=> B1,
    (Dist1 #=< N2) #<=> B2,
    (Dist5 #=< E1) #<=> B3,
    (Dist5 #=< S5) #<=> B4,
    (Dist1 #=< W4) #<=> B5,
    (Dist1 #=< W5) #<=> B6,
    ValorCelula1 #= B1 + B2 + B3 + B4 + B5 + B6.
