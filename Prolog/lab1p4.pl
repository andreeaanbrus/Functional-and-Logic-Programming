%4.
%a. Write a predicate to determine the difference of two sets

%A = [1,2,3,5], B = [1,3] => A/B = [2,5]
%
findElemInList([], _) :- false.
findElemInList([E], E) :- true.
findElemInList([E|_], E) :- true.
findElemInList([_|T], E) :- findElemInList(T, E).

difference([], _, []).
difference([H|T], L, [H|RT]) :- not(findElemInList(L, H)), difference(T, L, RT).
difference([H|T], L, RT) :- findElemInList(L, H), difference(T, L, RT).

%b. Write a predicate to add value 1 after every even element from a list
%
addOne([], []).
addOne([H|T], [H, 1 | RT]) :- Rez is H mod 2, 
    						Rez =:= 0,
    						addOne(T, RT).
addOne([H|T], [H|RT]) :- addOne(T, RT).
