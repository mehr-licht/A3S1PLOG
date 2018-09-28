%aluno(nome, cadeira)
aluno(joao, paradigmas).
aluno(maria, paradigmas).
aluno(ze,paradigmas).
aluno(joel, lab2).
aluno(joel, estruturas).
%frequenta(nome,universidade)
frequenta(joao, feup).
frequenta(maria, feup).
frequenta(joel, ist).
%professor(nome, cadeira)
professor(carlos, paradigmas).
professor(ana_paula, estruturas).
professor(pedro, lab2).
%funcionario(nome,instituicao).
funcionario(pedro, ist).
funcionario(ana_paula, feup).
funcionario(carlos, feup).
alunosProfessor(NomeProfessor,NomeAluno):-aluno(NomeAluno, Cadeira),professor(NomeProfessor,Cadeira).
universidade(NomeUni,Trabalhador):-funcionario(Trabalhador,NomeUni).
universidade(NomeUni,Estudantes):-funcionario(Trabalhador,NomeUni),professor(Trabalhador,Cadeira),aluno(Estudantes,Cadeira).

colegaDisciplina(AlunoA,AlunoB):-aluno(AlunoA,Cadeira),aluno(AlunoB,Cadeira),frequenta(AlunoA, NomeUni),frequenta(AlunoB,NomeUni).
colegaProfessor(ProfessorA,ProfessorB):-funcionario(ProfessorA, NomeUni), funcionario(ProfessorB,NomeUni).


%a
%alunosProfessor(NomeProfessor,X). 
%b
%universidade(X,feup).
%c
%colegaDisciplina(joao,Y).
%