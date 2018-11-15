%1.
%a. Sort a list with removing the double values. E.g.: [4 2 6 2 3 4] --> [2 3 4 6]
%b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to sort every
%sublist with removing the doubles.
%Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [
insertUnique([], E, [E]).
%insertUnique([E|T], E, [E|T]).
insertUnique([H|T], E, [E, H|T]) :- E < H.
insertUnique([H|T], E, [H|R]) :- E > H, insertUnique(T, E, R).

sortUnique([],[]).
sortUnique([H|T], R) :- sortUnique(T, RT), insertUnique(RT,H, R).

sortHetero([], []).
sortHetero([H|T], [H|R]) :- number(H), sortHetero(T, R).
sortHetero([H|T], [Rez|RT]) :- is_list(H), sortUnique(H, Rez), sortHetero(T, RT).
