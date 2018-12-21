
:- consult('menuTutorial.pl').
:- consult('printBoards.pl').
:- consult('logicLamps.pl').
:- consult('utilities.pl').
:- consult('fillSides.pl').
:- consult('filling.pl').

/*
* FICHEIROS testes
*/
:- consult('testeUnitarios.pl').
:- consult('testeUnitarioV9.pl').
:- consult('testeUnitarioV16.pl').
:- consult('testeUnitarioV25.pl').
/**
:- use_module(library(between)).
:- use_module(library(system)).
**/
:- use_module(library(statistics)).
:- use_module(library(lists)).
:- use_module(library(clpfd)).
:- use_module(library(random)).
/**
 * @brief lanca o jogo
 */
play:-
    printTutorialMainMenu.