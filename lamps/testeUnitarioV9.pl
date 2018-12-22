
calc1_12(N1,N2,E1,S3,W2,W3, Dist1, Dist3, ValorCelula1):-
    (Dist1 #=< N1) #<=> B1,
    (Dist1 #=< N2) #<=> B2,
    (Dist3 #=< E1) #<=> B3,
    (Dist3 #=< S3) #<=> B4,
    (Dist1 #=< W2) #<=> B5,
    (Dist1 #=< W3) #<=> B6,
    ValorCelula1 #= B1 + B2 + B3 + B4 + B5 + B6.
calc2_12(N1,N2,N3,E1,E3,S2,W1,W3,Dist1,Dist2,Dist3,ValorCelula2):-
    (Dist1 #=< N1) #<=> B1,
    (Dist1 #=< N2) #<=> B2,
    (Dist1 #=< N3) #<=> B3,
    (Dist2 #=< E1) #<=> B4,
    (Dist2 #=< E3) #<=> B5,
    (Dist3 #=< S2) #<=> B6,
    (Dist2 #=< W1) #<=> B7,
    (Dist2 #=< W3) #<=> B8,
    ValorCelula2 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc3_12(N2,N3,E1,E2,S1,W3,Dist1,Dist3,ValorCelula3):-
    (Dist1 #=< N2) #<=> B1,
    (Dist1 #=< N3) #<=> B2,
    (Dist1 #=< E1) #<=> B3,
    (Dist1 #=< E2) #<=> B4,
    (Dist3 #=< S1) #<=> B5,
    (Dist3 #=< W3) #<=> B6,
    ValorCelula3 #= B1 + B2 + B3 + B4 + B5 + B6.
calc4_12(N1,N3,E2,S1,S3,W1,W2,W3, Dist1, Dist2, Dist3, ValorCelula4):-
    (Dist2 #=< N1) #<=> B1,
    (Dist2 #=< N3) #<=> B2,
    (Dist3 #=< E2) #<=> B3,
    (Dist2 #=< S1) #<=> B4,
    (Dist2 #=< S3) #<=> B5,
    (Dist1 #=< W1) #<=> B6,
    (Dist1 #=< W2) #<=> B7,
    (Dist1 #=< W3) #<=> B8,
    ValorCelula4 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc5_12(N2,E2,S2,W2,Dist2,ValorCelula5):-
    (Dist2 #=< N2) #<=> B1,
    (Dist2 #=< E2) #<=> B2,
    (Dist2 #=< S2) #<=> B3,
    (Dist2 #=< W2) #<=> B4,
    ValorCelula5 #= B1 + B2 + B3 + B4.
calc6_12(N1,N3,E1,E2,E3,S1,S3,W2,Dist1, Dist2, Dist3, ValorCelula6):-
    (Dist2 #=< N1) #<=> B1,
    (Dist2 #=< N3) #<=> B2,
    (Dist1 #=< E1) #<=> B3,
    (Dist1 #=< E2) #<=> B4,
    (Dist1 #=< E3) #<=> B5,
    (Dist2 #=< S1) #<=> B6,
    (Dist2 #=< S3) #<=> B7,
    (Dist3 #=< W2) #<=> B8,
    ValorCelula6 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc7_12(N1,E3,S2,S3,W1,W2, Dist1, Dist3, ValorCelula7):-
    (Dist3 #=< N1) #<=> B1,
    (Dist3 #=< E3) #<=> B2,
    (Dist1 #=< S2) #<=> B3,
    (Dist1 #=< S3) #<=> B4,
    (Dist1 #=< W1) #<=> B5,
    (Dist1 #=< W2) #<=> B6,
    ValorCelula7 #= B1 + B2 + B3 + B4 + B5 + B6.
calc8_12(N2,E1,E3,S1,S2,S3,W1,W3,Dist1,Dist2,Dist3,ValorCelula8):-
    (Dist3 #=< N2) #<=> B1,
    (Dist2 #=< E1) #<=> B2,
    (Dist2 #=< E3) #<=> B3,
    (Dist1 #=< S1) #<=> B4,
    (Dist1 #=< S2) #<=> B5,
    (Dist1 #=< S3) #<=> B6,
    (Dist2 #=< W1) #<=> B7,
    (Dist2 #=< W3) #<=> B8,
    ValorCelula8 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc9_12(N3,E2,E3,S1,S2,W1,Dist1,Dist3,ValorCelula9):-
    (Dist3 #=< N3) #<=> B1,
    (Dist1 #=< E2) #<=> B2,
    (Dist1 #=< E3) #<=> B3,
    (Dist1 #=< S1) #<=> B4,
    (Dist1 #=< S2) #<=> B5,
    (Dist3 #=< W1) #<=> B6,
    ValorCelula9 #= B1 + B2 + B3 + B4 + B5 + B6.

testUnitarioV12(Vars):-
    Vars = [N1,N2,N3,E1,E2,E3,S1,S2,S3,W1,W2,W3], %
    ValorCelula1 #= 4,               %
    ValorCelula2 #= 3,  %
    ValorCelula3 #= 4, %
    ValorCelula4 #= 3, %
    ValorCelula5 #= 0,               %
    ValorCelula6 #= 3,  %
    ValorCelula7 #= 4, %
    ValorCelula8 #= 3   , %
    ValorCelula9 #= 4,               %
    Dist1 #= 1, 
    Dist2 #= 2, 
    Dist3 #= 3,    %                 
    domain(Vars,0,3),                    

    %linha de cima
    calc1_12(N1,N2,E1,S3,W2,W3, Dist1, Dist3, ValorCelula1),
    calc2_12(N1,N2,N3,E1,E3,S2,W1,W3, Dist1, Dist2, Dist3, ValorCelula2),
    calc3_12(N2,N3,E1,E2,S1,W3, Dist1, Dist3, ValorCelula3),
    
    calc4_12(N1,N3,E2,S1,S3,W1,W2,W3, Dist1, Dist2, Dist3,ValorCelula4),
    calc5_12(N2,E2,S2,W2, Dist2, ValorCelula5),
    calc6_12(N1,N3,E1,E2,E3,S1,S3,W2, Dist1,Dist2, Dist3, ValorCelula6),
    
    calc7_12(N1,E3,S2,S3,W1,W2, Dist1, Dist3,ValorCelula7),
    calc8_12(N2,E1,E3,S1,S2,S3,W1,W3, Dist1, Dist2, Dist3,ValorCelula8),
    calc9_12(N3,E2,E3,S1,S2,W1, Dist1, Dist3, ValorCelula9),

    labeling([ff],Vars),
    printLine(Vars),nl.
