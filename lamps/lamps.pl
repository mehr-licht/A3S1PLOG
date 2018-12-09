
:- consult('menuTutorial.pl').
:- consult('printBoards.pl').
:- consult('logicLamps.pl').
:- consult('testVariables.pl').
/**
:- use_module(library(between)).
:- use_module(library(random)).
:- use_module(library(system)).
**/
:- use_module(library(lists)).
:- use_module(library(clpfd)).


/**
 * @brief lanca o jogo
 */
play:-
    printTutorialMainMenu.