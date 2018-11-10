aluno(joao, paradigmas).
aluno(maria, paradigmas).
aluno(joel, lab2).
aluno(joel, estruturas).
frequenta(joao, feup).
frequenta(maria, feup).
frequenta(joel, ist).
professor(carlos, paradigmas).
professor(ana_paula, estruturas).
professor(pedro, lab2).
funcionario(pedro, ist).
funcionario(ana_paula, feup).
funcionario(carlos, feup). 

% a) alunos do professor X
/*alunoProf(professor)*/
alunoProf(X,Y):- professor(X,UC), aluno(Y,UC).
% alunoProf(carlos,Y).

% b) pessoas da Universidade X (alunos ou docentes)
/*pessoaUniversidade(universidade,pessoa)*/
pessoaUniversidade(X,Y):- frequenta(Y,X) ;funcionario(Y,X).
% pessoaUniversidade(feup,Y).

% c)
/*colega(nome1,nome2)*/
colega(X,Z):- frequenta(X,Y),frequenta(Z,Y),Z\=X ; funcionario(X,Y),funcionario(Z,Y),Z\=X.
% colega(carlos,X).


/*
melhor do que colocar ; para ou é fazer varias regras. cada opcao em cada regra
*/