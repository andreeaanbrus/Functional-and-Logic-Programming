%3.
%a. Define a predicate to remove from a list all repetitive elements.
%Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])

occurences([], _, 0).
occurences([E|T], E, R) :- occurences(T, E, RT), R is RT + 1.
occurences([_|T], E, R) :- occurences(T, E, R).

remove([], _, []).
remove([X|T], X, RT) :- remove(T, X, RT).
remove([H|T], X, [H|R]) :- remove(T, X, R).

removeDup([],[]).
removeDup([H|T], RT) :- occurences([H|T], H, Cnt),
    					Cnt > 1,
    					remove(T, H, R),
						removeDup(R, RT).
removeDup([H|T], [H|RT]) :- occurences([H|T], H, Cnt), 
    					Cnt =< 1, 
    					removeDup(T, RT).

%b. Remove all occurrence of a maximum value from a list on integer numbers.

maximum([E], E).
maximum([H|T], H) :- maximum(T, RT), RT < H.
maximum([H|T], RT) :- maximum(T, RT), RT >= H.

removeMaximum(L, R):- maximum(L, M),remove(L, M, R).