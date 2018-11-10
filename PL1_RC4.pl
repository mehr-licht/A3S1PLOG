/*
peru, 
frango, 
salmão, 
solha, 
cerveja, 
vinho verde, 
vinho maduro, 
Ana, 
António, 
Barbara, 
Bruno, 
gosta,
casado, 
combina 
*/
gosta('Ana','Antonio').
gosta('Barbara','Bruno').
gosta('Bruno','Antonio').
gosta('Antonio','Barbara').
gosta('Ana','vinho verde').
gosta('Barbara',salmao).
gosta('Bruno',peru).
gosta('Antonio',cerveja).
casado('Bruno','Ana').
casado('Barbara','Antonio').
combina(peru,'vinho maduro').
combina(frango,cerveja).
combina(solha,'vinho verde').
combina(salmao,'vinho verde').

% a) Ana e Bruno são casados e gostam de vinho verde?
%casado('Ana','Bruno'),gosta('Ana','vinho verde'),gosta('Bruno','vinho verde');casado('Bruno','Ana'),gosta('Ana','vinho verde'),gosta('Bruno','vinho verde').
% (casado('Ana','Bruno') ; casado('Bruno','Ana') ) ,gosta('Ana','vinho verde'),gosta('Bruno','vinho verde') .

% b) Que bebida combina com salmão?
% combina(salmao,X).

% c) Que comidas combinam com vinho verde? 
% combina(X,'vinho verde').

