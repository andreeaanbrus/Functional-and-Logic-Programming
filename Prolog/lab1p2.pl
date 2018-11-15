%a. Write a predicate to remove all occurrences of a certain atom from a list.
%
remove([], _, []).
remove([X|T], X, RT) :- remove(T, X, RT).
remove([H|T], X, [H|R]) :- remove(T, X, R).

%Define a predicate to produce a list of pairs (atom n) from an initial list of atoms. In this initial list atom has
%n occurrences.
%Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3, 1]].



numberOfOccurences([E], E, 1).
numberOfOccurences([_], _, 0).
numberOfOccurences([E|T], E, NewR) :- numberOfOccurences(T, E, RT), NewR is RT + 1.
numberOfOccurences([_|T], E, R) :- numberOfOccurences(T, E, R).

countAtoms([], []).
countAtoms([H|T], [[H|RezH]|RT] ) :- numberOfOccurences([H|T], H, RezH), remove(T, H, Rez),countAtoms(Rez, RT).