piloto(lamb).
piloto(besenyei).
piloto(chambliss).
piloto(macLean).
piloto(mangold).
piloto(jones).
piloto(bonhomme).

%equipa(nomedaEquipa,elementodaEquipa)
equipa(breitling,lamb).
equipa(redBul,besenyei).
equipa(redBul,chambliss).
equipa(meditRacingTeam,macLean).
equipa(cobra,mangold).
equipa(matador,jones).
equipa(matador,bonhomme).

%aviao(piloto,modeloDoAviao)
aviao(lamb,mx2).
aviao(besenyei,edge540).
aviao(chambliss,edge540).
aviao(macLean,edge540).
aviao(mangold,edge540).
aviao(jones,edge540).
aviao(bonhomme,edge540).

%circuito(localDoCircuito)
circuito(istambul).
circuito(budapest).
circuito(porto).

%venceu(nomePiloto,localDoCircuito)
venceu(jones,porto).
venceu(mangold,budapest).
venceu(mangold,istambul).

%gates(localDoCircuito,numeroGates)
gates(istambul,9).
gates(budapest,6).
gates(porto,5).

equipaVencedora(NomeEquipa,LocalDoCircuito):- venceu(X,LocalDoCircuito), equipa(NomeEquipa,X).


%a
%venceu(X,porto).
%b
%venceu(NomePiloto,porto),equipa(NomedaEquipa,NomePiloto), NomedaEquipa \= NomePiloto.
%venceu(NomePiloto,porto),equipa(NomedaEquipa,NomePiloto)
%equipaVencedora(X,porto).
%c
%venceu(X,LocalDoCircuito),venceu(X,Y) , LocalDoCircuito \= Y.
%d
%gates(X,Y), Y > 8
%e
%piloto(X),aviao(X,Y), Y \= edge450.
