%a. Substitute all occurrences of an element of a list with all the elements of another list.
%Eg. subst([1,2,1,3,1,4],1,[10,11],X) produces X=[10,11,2,10,11,3,10,11,4].
%aproximativ ok

add_from_list(L, [], L).
add_from_list(L, [H | T], [H | R]) :-
    add_from_list(L, T, R).

subst([], _, _, []).
subst([E|T], E, L, RT) :-
    subst(T, E, L, R),
    add_from_list(R, L, RT).
subst([H|T], E, L, [H|RT]) :- 
    subst(T, E, L, RT).

%b. For a heterogeneous list, formed from integer numbers and list of numbers, replace in every sublist all
%occurrences of the first element from sublist it a new given list.
%Eg.: [1, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] si [11, 11] =>
%[1, [11, 11, 1, 11, 11], 3, 6, [11, 11, 10, 1, 3, 9], 5, [11 11 11 11 11 11], 7]

substHetero([], _, []).
substHetero([H|T], L, [H|Rez]) :- number(H), substHetero(T, L, Rez).
substHetero([[H1|T1]|T], L, [RH|RT]) :-  subst([H1|T1], H1, L, RH), substHetero(T, L, RT).