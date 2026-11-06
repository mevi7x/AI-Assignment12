edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').
edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').
edge('Tabuk', 'Taif').
edge('Taif', 'Dammam').
edge('Dammam', 'Qatif').
edge('Qatif', 'Dammam').
edge('Qatif', 'Madinah').
edge('Dammam', 'Riyadh').
edge('Riyadh', 'Dammam').

travel(Start, End, Path) :-
    find_path(Start, End, [Start], Path).

find_path(Node, Node, _, [Node]).
find_path(Current, End, Visited, [Current|Path]) :-
    edge(Current, Next),
    \+ member(Next, Visited),
    find_path(Next, End, [Next|Visited], Path).