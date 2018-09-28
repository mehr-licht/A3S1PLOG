%cargo(funcao, nome)

cargo(tecnico, rogerio).
cargo(tecnico, ivone).
cargo(engenheiro, daniel).
cargo(engenheiro, isabel).
cargo(engenheiro, oscar).
cargo(engenheiro, tomas).
cargo(engenheiro, ana).
cargo(supervisor, luis).
cargo(supervisor_chefe, sonia).
cargo(secretaria_exec, laura).
cargo(diretor, santiago).
%chefiado_por(subordinado,chefao)
chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, director).
chefiado_por(secretaria_exec, director).

%a
% Cargos hierarquicos superiores ao tecnico
%b  A ivone eh engenheira  »O cargo ocupado da Ivone
%c quem é o supervisor
%d quem é  são os engenheiros ou supervisores

comprou(joao, honda).
comprou(joao, uno).
comprou(ana, alfa).
ano(alfa,2015).
ano(honda, 1997).
ano(uno, 1998).
valor(honda, 20000).
valor(uno, 7000).
valor(alfa,7000).
pode_vender(Pessoa,Carro,Ano):-valor(Carro,Valor), Valor < 10000, ano(Carro,Ano), comprou(Pessoa,Carro), (2018-Ano) < 10.
pode_vender2(Pessoa,Carro,AnoActual):-valor(Carro,Valor), Valor < 10000, ano(Carro,Ano), 
                comprou(Pessoa,Carro), (AnoActual-Ano) < 10.
