
:- consult('menuTutorial.pl').
:- consult('printBoards.pl').
:- consult('logicLamps.pl').
:- consult('utilities.pl').
:- consult('fillSides.pl').
/**
:- use_module(library(between)).
:- use_module(library(system)).
**/
:- use_module(library(lists)).
:- use_module(library(clpfd)).
:- use_module(library(random)).
/**
 * @brief lanca o jogo
 */
play:-
    printTutorialMainMenu.