piloto('Lamb').
piloto('Besenyei').
piloto('Chambliss').
piloto('MacLean').
piloto('Mangold').
piloto('Jones').
piloto('Bonhomme').
/*(equipa(piloto,name of the team)*/
equipa('Lamb', 'Breitling').
equipa('Besenyei', 'Red Bull').
equipa('Chambliss', 'Red Bull').
equipa('MacLean', 'Mediterranean Racing Team').
equipa('Mangold', 'Cobra').
equipa('Jones', 'Matador').
equipa('Bonhomme', 'Matador').
/*aviao(piloto,marca)*/
aviao('Lamb', 'MX2').
aviao('Besenyei', 'Edge540').
aviao('Chambliss', 'Edge540').
aviao('MacLean', 'Edge540').
aviao('Mangold', 'Edge540').
aviao('Jones', 'Edge540').
aviao('Bonhomme', 'Edge540').
circuito('Porto').
circuito('Istanbul').
circuito('Budapest').
/*venceu(circuito,piloto)*/
venceu('Porto','Jones').
venceu('Istanbul','Mangold').
venceu('Budapest','Mangold').
/*gates(circuito,number of gates)*/
gates('Porto',5).
gates('Istanbul',9).
gates('Budapest',6).
/*equipavenceu(equipa,circuito)*/
equipavenceu(X,Y) :- equipa(Z,X), venceu(Y,Z). 


% a)
% venceu('Porto',X).

% b)
% equipavenceu(X,'Porto').

% c) para ja temos de fazer que venceu pelo menos 2 (um, outro) e os 2 sao diferentes
% venceu(Circuito1,Piloto),venceu(Circuito2,Piloto), Circuito1\=Circuito2.

% d) usar maior
% circuito(X), gates(X,Y), Y>8.

% e) 
% piloto(X), aviao(X,Y), Y \='Edge540'.

