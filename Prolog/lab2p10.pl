%prime numbers
prime(1) :- !.
prime(0) :- !.
prime(2) :- !.
prime(3) :- !.
prime(X) :- X > 3, C is 3,prime2(X, C).

prime2(X, Nr) :-  X mod Nr =:= 0, false.
prime2(X, Nr) :- Nr >= X ->  true;X mod Nr =\= 0, NewNr is Nr + 1, prime2(X, NewNr).

%a. For a list of integer numbers, define a predicate to write twice in list every prime number.

dupplicate([], []).
dupplicate([H|T], [H,H|RT]) :- prime(H), dupplicate(T, RT).
dupplicate([H|T], [H|RT]) :- dupplicate(T, RT).


%b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to write in
%every sublist twice every prime number.
%Eg.: [1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5] =>
%[1, [2, 2, 3, 3], 4, 5, [1, 4, 6], 3, [1, 3, 3, 7, 7, 9, 10], 5]
heterodup([],[]).
heterodup([H|T], [H|R]) :- number(H), heterodup(T, R).
heterodup([H|T], [H|R]) :- atom(H), heterodup(T,R).
heterodup([H|T], [RH|RT]) :- is_list(H), dupplicate(H, RH),heterodup(T, RT).