:- consult('menuGame.pl').
:- consult('clobberDisplay.pl').
:- consult('clobberLogica.pl').
:- consult('utilities.pl').
:- consult('input.pl').
:- consult('botsLogic.pl').
:- use_module(library(random)).
:- use_module(library(system)).
:- use_module(library(lists)).


play :-
      mainMenu.

