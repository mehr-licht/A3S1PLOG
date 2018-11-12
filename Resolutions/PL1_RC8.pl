/*Suponha a seguinte Base de Factos Prolog:
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
chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, director).
chefiado_por(secretaria_exec, director).
Onde os predicados cargo/2 e chefiado_por/2 são autoexplicativos. Escreva em linguagem natural as
seguintes interrogações Prolog:
a) ?- chefiado_por(tecnico, X), chefeido_por(X,Y).
b) ?- chefiado_por(tecnico, X), cargo(X,ivone), cargo(Y,Z).
c) ?- cargo(supervisor, X); cargo(supervisor, X).
d) ?- cargo(J,P), (chefiado_por(J, supervisor_chefe);
chefiado_por(J, supervisor)).
e) ?- chefiado_por(P, director), not(cargo(P, carolina)).
Sem utilizar o computador responda qual seria a primeira resposta encontrada pelo Prolog para cada uma
destas interrogações*/