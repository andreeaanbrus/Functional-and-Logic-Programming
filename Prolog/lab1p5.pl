%5.
%a. Write a predicate to compute the union of two sets
%res set is not sorted

findElemInList([], _) :- false.
findElemInList([E], E) :- true.
findElemInList([E|_], E) :- true.
findElemInList([_|T], E) :- findElemInList(T, E).

union([], B, B).
union(A, [], A).
union([H|T], B, RT) :- findElemInList(B, H), 
    						union(T, B, RT).
union([H|T], B, [H|RT]) :- not(findElemInList(B, H)),
    					union(T, B, RT).

%b. Write a predicate to determine the set of all the pairs of elements in a list.
%Eg.: L = [a b c d] => [[a b] [a c] [a d] [b c] [b d] [c d]]
%
matchWithAllElemsFromList(_, [], []).
matchWithAllElemsFromList(E, [H|T], [RH|RT]) :- RH = [E|H], matchWithAllElemsFromList(E, T, RT).

makePairs([], []).
makePairs([H|T], [R|RT]) :- matchWithAllElemsFromList(H, T, R), makePairs(T, RT).
