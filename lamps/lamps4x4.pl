
calc1_16(N1,N2,E1,S4,W3,W4, Dist1, Dist4, ValorCelula1):-
    (Dist1 #=< N1) #<=> B1,
    (Dist1 #=< N2) #<=> B2,
    (Dist4 #=< E1) #<=> B3,
    (Dist4 #=< S4) #<=> B4,
    (Dist1 #=< W3) #<=> B5,
    (Dist1 #=< W4) #<=> B6,
    ValorCelula1 #= B1 + B2 + B3 + B4 + B5 + B6.
calc2_16(N1,N2,N3,E1,E4,S3,W2,W4,Dist1,Dist2,Dist3,Dist4,ValorCelula2):-
    (Dist1 #=< N1) #<=> B1,
    (Dist1 #=< N2) #<=> B2,
    (Dist1 #=< N3) #<=> B3,
    (Dist2 #=< W4) #<=> B4,
    (Dist2 #=< W2) #<=> B5,
    (Dist3 #=< E1) #<=> B6,
    (Dist3 #=< E4) #<=> B7,
    (Dist4 #=< S3) #<=> B8,
    ValorCelula2 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc3_16(N2,N3,N4,E1,E3,S2,W1,W4,Dist1,Dist2,Dist3,Dist4,ValorCelula3):-
    (Dist1 #=< N2) #<=> B1,
    (Dist1 #=< N3) #<=> B2,
    (Dist1 #=< N4) #<=> B3,
    (Dist2 #=< E1) #<=> B4,
    (Dist2 #=< E3) #<=> B5,
    (Dist4 #=< S2) #<=> B6,
    (Dist3 #=< W1) #<=> B7,
    (Dist3 #=< W4) #<=> B8,
    ValorCelula3 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc4_16(N3,N4,E1,E2,S1,W4, Dist1, Dist4, ValorCelula4):-
    (Dist1 #=< N3) #<=> B1,
    (Dist1 #=< N4) #<=> B2,
    (Dist1 #=< E1) #<=> B3,
    (Dist1 #=< E2) #<=> B4,
    (Dist4 #=< S1) #<=> B5,
    (Dist4 #=< W4) #<=> B6,
    ValorCelula4 #= B1 + B2 + B3 + B4 + B5 + B6.
calc5_16(N1,N3,E2,S1,S4,W2,W3,W4,Dist1,Dist2,Dist3,Dist4,ValorCelula5):-
    (Dist2 #=< N1) #<=> B1,
    (Dist2 #=< N3) #<=> B2,
    (Dist4 #=< E2) #<=> B3,
    (Dist3 #=< S1) #<=> B4,
    (Dist3 #=< S4) #<=> B5,
    (Dist1 #=< W2) #<=> B6,
    (Dist1 #=< W3) #<=> B7,
    (Dist1 #=< W4) #<=> B8,
    ValorCelula5 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc6_16(N2,N4,E2,S3,W1,W3, Dist2, Dist3, ValorCelula6):-
    (Dist2 #=< N2) #<=> B1,
    (Dist2 #=< N4) #<=> B2,
    (Dist3 #=< E2) #<=> B3,
    (Dist3 #=< S3) #<=> B4,
    (Dist2 #=< W1) #<=> B5,
    (Dist2 #=< W3) #<=> B6,
    ValorCelula6 #= B1 + B2 + B3 + B4 + B5 + B6.
calc7_16(N1,N3,E2,E4,S2,W3, Dist2, Dist3, ValorCelula7):-
    (Dist2 #=< N1) #<=> B1,
    (Dist2 #=< N3) #<=> B2,
    (Dist2 #=< E2) #<=> B3,
    (Dist2 #=< E4) #<=> B4,
    (Dist3 #=< S2) #<=> B5,
    (Dist3 #=< W3) #<=> B6,
    ValorCelula7 #= B1 + B2 + B3 + B4 + B5 + B6.
calc8_16(N2,N4,E1,E2,E3,S1,S4,W3,Dist1,Dist2,Dist3,Dist4,ValorCelula8):-
    (Dist2 #=< N2) #<=> B1,
    (Dist2 #=< N4) #<=> B2,
    (Dist1 #=< E1) #<=> B3,
    (Dist1 #=< E2) #<=> B4,
    (Dist1 #=< E3) #<=> B5,
    (Dist3 #=< S1) #<=> B6,
    (Dist3 #=< S4) #<=> B7,
    (Dist4 #=< W3) #<=> B8,
    ValorCelula8 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc9_16(N1,N4,E3,S2,S4,W1,W2,W3,Dist1,Dist2,Dist3,Dist4,ValorCelula9):-
    (Dist3 #=< N1) #<=> B1,
    (Dist3 #=< N4) #<=> B2,
    (Dist4 #=< E3) #<=> B3,
    (Dist2 #=< S2) #<=> B4,
    (Dist2 #=< S4) #<=> B5,
    (Dist1 #=< W1) #<=> B6,
    (Dist1 #=< W2) #<=> B7,
    (Dist1 #=< W3) #<=> B8,
    ValorCelula9 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc10_16(N2,E3,S1,S3,W2,W4, Dist2, Dist3, ValorCelula10):-
    (Dist3 #=< N2) #<=> B1,
    (Dist3 #=< E3) #<=> B2,
    (Dist2 #=< S1) #<=> B3,
    (Dist2 #=< S3) #<=> B4,
    (Dist2 #=< W2) #<=> B5,
    (Dist2 #=< W4) #<=> B6,
    ValorCelula10 #= B1 + B2 + B3 + B4 + B5 + B6.
calc11_16(N3,E1,E3,S2,S4,W2, Dist2, Dist3, ValorCelula11):-
    (Dist3 #=< N3) #<=> B1,
    (Dist2 #=< E1) #<=> B2,
    (Dist2 #=< E3) #<=> B3,
    (Dist2 #=< S2) #<=> B4,
    (Dist2 #=< S4) #<=> B5,
    (Dist3 #=< W2) #<=> B6,
    ValorCelula11 #= B1 + B2 + B3 + B4 + B5 + B6.
calc12_16(N1,N4,E2,E3,E4,S1,S3,W2,Dist1,Dist2,Dist3,Dist4,ValorCelula12):-
    (Dist3 #=< N1) #<=> B1,
    (Dist3 #=< N4) #<=> B2,
    (Dist1 #=< E2) #<=> B3,
    (Dist1 #=< E3) #<=> B4,
    (Dist1 #=< E4) #<=> B5,
    (Dist2 #=< S1) #<=> B6,
    (Dist2 #=< S3) #<=> B7,
    (Dist4 #=< W2) #<=> B8,
    ValorCelula12 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc13_16(N1,E4,S3,S4,W1,W2, Dist1, Dist4, ValorCelula13):-
    (Dist4 #=< N1) #<=> B1,
    (Dist4 #=< E4) #<=> B2,
    (Dist1 #=< S3) #<=> B3,
    (Dist1 #=< S4) #<=> B4,
    (Dist1 #=< W1) #<=> B5,
    (Dist1 #=< W2) #<=> B6,
    ValorCelula13 #= B1 + B2 + B3 + B4 + B5 + B6.
calc14_16(N2,E1,E4,S2,S3,S4,W1,W2,Dist1,Dist2,Dist3,Dist4,ValorCelula14):-
    (Dist4 #=< N2) #<=> B1,
    (Dist3 #=< E1) #<=> B2,
    (Dist3 #=< E4) #<=> B3,
    (Dist1 #=< S2) #<=> B4,
    (Dist1 #=< S3) #<=> B5,
    (Dist1 #=< S4) #<=> B6,
    (Dist2 #=< W1) #<=> B7,
    (Dist2 #=< W2) #<=> B8,
    ValorCelula14 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc15_16(N3,E2,E4,S1,S2,S3,W1,W4,Dist1,Dist2,Dist3,Dist4,ValorCelula15):-
    (Dist4 #=< N3) #<=> B1,
    (Dist2 #=< E2) #<=> B2,
    (Dist2 #=< E4) #<=> B3,
    (Dist1 #=< S1) #<=> B4,
    (Dist1 #=< S2) #<=> B5,
    (Dist1 #=< S3) #<=> B6,
    (Dist3 #=< W1) #<=> B7,
    (Dist3 #=< W4) #<=> B8,
    ValorCelula15 #= B1 + B2 + B3 + B4 + B5 + B6 + B7 + B8.
calc16_16(N4,E3,E4,S1,S2,W1, Dist1, Dist4, ValorCelula16):-
    (Dist4 #=< N4) #<=> B1,
    (Dist1 #=< E3) #<=> B2,
    (Dist1 #=< E4) #<=> B3,
    (Dist1 #=< S1) #<=> B4,
    (Dist1 #=< S2) #<=> B5,
    (Dist4 #=< W1) #<=> B6,
    ValorCelula16 #= B1 + B2 + B3 + B4 + B5 + B6.

testUnitarioV16(Vars):-
    Vars = [N1,N2,N3,N4,E1,E2,E3,E4,S1,S2,S3,S4,W1,W2,W3,W4], %
    ValorCelula1 #= 4,               %
    ValorCelula2 #= 6,  %
    ValorCelula3 #= 6, %
    ValorCelula4 #= 5, %
    ValorCelula5 #= 5,               %
    ValorCelula6 #= 2,  %
    ValorCelula7 #= 6, %
    ValorCelula8 #= 4, %
    ValorCelula9 #= 4,               %
    ValorCelula10 #= 6,  %
    ValorCelula11 #= 6, %
    ValorCelula12 #= 6, %
    ValorCelula13 #= 4,               %
    ValorCelula14 #= 6,  %
    ValorCelula15 #= 6, %
    ValorCelula16 #= 4, %        
    Dist1 #= 1, 
    Dist2 #= 2, 
    Dist3 #= 3, 
    Dist4 #= 4,    %                 
    domain(Vars,0,4),                    

    %linha de cima
    calc1_16(N1,N2,E1,S4,W3,W4, Dist1, Dist4, ValorCelula1),
    calc2_16(N1,N2,N3,E1,E4,S3,W2,W4, Dist1, Dist2, Dist3,Dist4, ValorCelula2),
    calc3_16(N2,N3,N4,E1,E3,S2,W1,W4, Dist1, Dist2, Dist3,Dist4, ValorCelula3),
    calc4_16(N3,N4,E1,E2,S1,W4, Dist1, Dist4, ValorCelula4),

%segunda linha
    calc5_16(N1,N3,E2,S1,S4,W2,W3,W4, Dist1, Dist2, Dist3,Dist4,ValorCelula5),
    calc6_16(N2,N4,E2,S3,W1,W3, Dist2, Dist3, ValorCelula6),
    calc7_16(N1,N3,E2,E4,S2,W3, Dist2, Dist3, ValorCelula7),
    calc8_16(N2,N4,E1,E2,E3,S1,S4,W3, Dist1, Dist2, Dist3,Dist4, ValorCelula8),

%quinta linha
calc9_16(N1,N4,E3,S2,S4,W1,W2,W3, Dist1, Dist2, Dist3,Dist4,ValorCelula9),
calc10_16(N2,E3,S1,S3,W2,W4, Dist2, Dist3, ValorCelula10),
calc11_16(N3,E1,E3,S2,S4,W2, Dist2, Dist3, ValorCelula11),
calc12_16(N1,N4,E2,E3,E4,S1,S3,W2, Dist1, Dist2, Dist3,Dist4, ValorCelula12),

%quarta linha
calc13_16(N1,E4,S3,S4,W1,W2, Dist1, Dist4, ValorCelula13),
calc14_16(N2,E1,E4,S2,S3,S4,W1,W3, Dist1, Dist2, Dist3,Dist4, ValorCelula14),
calc15_16(N3,E2,E4,S1,S2,S3,W1,W4, Dist1, Dist2, Dist3,Dist4, ValorCelula15),
calc16_16(N4,E3,E4,S1,S2,W1, Dist1, Dist4, ValorCelula16),

    labeling([],Vars).