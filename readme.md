# **PLOG**




## Instructions for running
$ sicstus


.    %indica um facto
?    %indica uma query

###Ficheiros com extensão .pl

 ?- Goal1,Goal2. %Prompt sample
:- %implica

PredicadoH :- PredicadoB1, PredicadoB2. %sample do implica

###Aridade:
>0 %chama-se regra
=0 %chama-se facto


###program sample

a.
b.
c.
d:- a,b,c. %virgulas representam o - e -v de ternas para o ar

%prolog é um mecanismo de backtracking

%simbolo para comentar

###update file
?- [filename].
?- consult(filename).

%voltar a carregar para considerar as correcoes
?-[-filename].

source.

###debug
 spy d. %marcação de um debug point
 


Programming In Logic - MIEIC FEUP

Projects done in colaboration with [TejInaco](https://github.com/TejInaco)

