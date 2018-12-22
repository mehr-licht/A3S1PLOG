
:- use_module(library(statistics)).
:- use_module(library(lists)).
:- use_module(library(clpfd)).
:- use_module(library(random)).
:- use_module(library(between)).

:- consult(menuTutorial).
:- consult(printBoards).
:- consult(logicLamps).
:- consult(utilities).
:- consult(fillSides).
:- consult(filling).

/*
* FICHEIROS testes
*/
:- consult('testeUnitarios.pl').
:- consult('testeUnitarioV9.pl').
:- consult('testeUnitarioV16.pl').
:- consult('testeUnitarioV25.pl').
/**

:- use_module(library(system)).
**/
/**
 * @brief lanca o jogo
 */
start:-
    printTutorialMainMenu(1).