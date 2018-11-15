%a. Determine the product of a number represented as digits in a list to a given digit.
%Eg.: [1 9 3 5 9 9] * 2 => [3 8 7 1 9 8]
prod([H|[]], N, 0, [R]) :- Rez is H * N, Rez < 10, R is Rez.
prod([H|[]], N, C, [R]) :- Rez is H * N, Rez >= 10, C is Rez div 10, R is Rez mod 10.
prod([H|T], N, 0, [R|RT]) :- prod(T, N, C, RT), 
                            C =:= 0,
                            NewR is H * N,
                            R < 10,
                            R is NewR.

prod([H|T], N, 0, [R|RT]) :- prod(T, N, C, RT),
                            C =\= 0,
                            NewR is H * N + C,
                            NewR < 10,
                            R is NewR.

prod([H|T], N, newC, [R|RT]) :- prod(T, N, C, RT),
                            C =:= 0,
                            NewR is H * N, 
                            NewR >= 10, 
                            R is NewR mod 10,
                            newC is NewR div 10.

prod([H|T], N, NewC, [R|RT]) :- prod(T, N, C, RT),
                                C =\= 0,
                                NewR is H * N + C,
                                NewR >= 10,
                                R is NewR mod 10,
                                NewC is NewR div 10.
prodfin(L, N, C, [C|R]) :- prod(L, N, C, R), C =\= 0 .
prodfin(L, N, C, R) :- prod(L, N, C, R).

%b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to replace
%every sublist with the position of the maximum element from that sublist.
%[1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
%[1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]

maxList([E], E).
maxList([H|T], H) :- maxList(T, RT), RT < H.
maxList([H|T], RT) :- maxList(T, RT), RT >= H.

findPos([], _, [], _).
findPos([E|T], E, [C|RT], C) :-  NewC is C + 1,findPos(T, E, RT, NewC).
findPos([_|T], E, RT, C) :-NewC is C + 1, findPos(T, E, RT, NewC). 

heteroChange([],[]).
heteroChange([H|T], [H|RT]) :- number(H), heteroChange(T, RT).
heteroChange([H|T], [RH|RT]) :- is_list(H), maxList(H, MaxNr), findPos(H, MaxNr, RH, 1),heteroChange(T, RT).
