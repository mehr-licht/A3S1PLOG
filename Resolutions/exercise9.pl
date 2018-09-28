%aluno(nome, cadeira)
aluno(joao, paradigmas).
aluno(maria, paradigmas).
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
%a
%aluno(NomeAluno, Cadeira),professor(NomeProfessor,Cadeira). 
%