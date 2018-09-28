# **PLOG**

### Notes

#Agrupamento de funcoes

( funcao(X,Z); funcao(VinhoVerde,Z)  ) , funcaoAzul(X). 

#Debug

spy (funcao).

retirar

nospy (funcao).

#para exectuar o ou
regra:-def1.
regra:-def2.
Isto é, fazer os dois predicatos com atomos diferentes

pred(+A,-B,?C) 
%A tem de estar instanciado
%B elemento de saída
%C elemento de entrada e de saída

\= %diferente
\+  %negação

male(_X).  %devolve apenas yes se existir valores possiveis

male(C). %vai devolvendo os valores possiveis um a um

##Consult and resconsult
reconsult('nomeFicheiro.pl')

## Instructions for running
$ sicstus

or

$ rlwrap sicstus     [uses the directional arrows/need to install first
                        sudo apt-get install rlwrap ]

check the difusal blog for detail information

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

