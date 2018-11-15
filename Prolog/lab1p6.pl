%6.
%a. Write a predicate to test if a list is a set.
%
isInList(_, []) :- false.
isInList(E, [E|_]) :- true.
isInList(E, [_|T]) :- isInList(E, T).

isSet([]) :- !.
isSet([H|T]) :- isInList(H, T), false.
isSet([H|T]) :- not(isInList(H, T)), isSet(T).

%b. Write a predicate to remove the first three occurrences of an element in a list. If the element occurs less
%than three times, all occurrences will be removed.
%
removeElem(_, [], []).
removeElem(E, [E], []).
removeElem(E, [E|T], RT) :- removeElem(E, T, RT).
removeElem(E, [H|T], [H|RT]) :- removeElem(E, T, RT).

findOccurences(_, [], 0).
findOccurences(E, [E|T], R) :- findOccurences(E, T, RT), R is RT + 1. 
findOccurences(E, [_|T], RT) :- findOccurences(E, T, RT).

removeFirst([],_,[]). 
removeFirst([H|T], H, T).
removeFirst([H|T], E, [H|RT]) :- removeFirst(T, E, RT).

solve(L, E, R3):-removeFirst(L, E,R1),
    			removeFirst(R1, E, R2),
    			removeFirst(R2, E, R3).
