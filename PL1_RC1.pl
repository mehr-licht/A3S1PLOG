male('Aldo Burrows').
male('Lincoln Burrows').
male('Michael Scofield').
male('LJ Burrows').
female('Christina Rose Scofield').
female('Lisa Rix').
female('Sara Tancredi').
female('Ella Scofield').
parent('Aldo Burrows', 'Lincoln Burrows').
parent('Aldo Burrows', 'Michael Scofield').
parent('Christina Rose Scofield', 'Lincoln Burrows').
parent('Christina Rose Scofield', 'Michael Scofield').
parent('Lisa Rix','LJ Burrows').
parent('Lincoln Burrows','LJ Burrows').
parent('Michael Scofield','Ella Scofield').
parent('Sara Tancredi','Ella Scofield').

% a)
% parent(X,'Michael Scofield'), parent(Y,'Michael Scofield'), X \= Y.

% b)
% parent('Aldo Burrows', X), parent('Aldo Burrows', Y), X \= Y.