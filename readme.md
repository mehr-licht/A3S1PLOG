## *Clobber and Lamps* ##

projects developed in the Programming In Logic course unit


### Project Infos
* **Date:** 3rd Year - 1st Semester - 2018/2019 (Dec 2018)
* **Topic:** Project
* **Course:** Programming In Logic
* **Course Link:** [link](https://sigarra.up.pt/feup/pt/ucurr_geral.ficha_uc_view?pv_ocorrencia_id=420002)
* **Project done with:** [Ricardo Silva](https://github.com/TejInaco)


### Disclaimer
This repository, and every other course unit repos on GitHub correspond to school projects from the respective course. The code on this repo is intended for educational purposes. I do not take any responsibility, liability or whateverity over any code faults, inconsistency or anything else. If you intend on copying most or parts of the code for your school projects, keep in mind that this repo is public, and that your professor might search the web for similar project solutions or whatnot and choose to fail you for copying. 

Template adapted from [zettca](https://github.com/zettca)







# **TODO**

Todo print the first variable Boards 


Fuction to build variable tables added
Update thre report

### Notes

CLOBBER with several errors and bugs LOLOLOL
 

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

