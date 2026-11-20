
% Facts
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').

edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Taif', 'Dammam').
edge('Taif', 'Tabuk').

edge('Tabuk', 'Taif').

edge('Riyadh', 'Dammam').

edge('Dammam', 'Riyadh').
edge('Dammam', 'Qatif').

edge('Qatif', 'Madinah').
edge('Qatif', 'Dammam').

% Travel rule
travel(From, To, Path) :-
    path(From, To, [From], P),
    reverse(P, Path).

% Base case
path(X, X, P, P).

% Recursive case
path(From, To, Visited, Path) :-
    edge(From, Next),
    \+ member(Next, Visited),
    path(Next, To, [Next|Visited], Path).
