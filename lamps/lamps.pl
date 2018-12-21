
:- consult('menuTutorial.pl').
:- consult('printBoards.pl').
:- consult('logicLamps.pl').
:- consult('lamps3x3.pl').
:- consult('lamps4x4.pl').
:- consult('testeUnitarioV20.pl').
:- consult('utilities.pl').
:- consult('fillSides.pl').
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