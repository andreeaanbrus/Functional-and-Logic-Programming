%Write a predicate to generate the list of all subsets with all elements of a given list.
%Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]
%[1,2,3,4] N=3 => [[1,2,3], [1,3,4], [1,2,4], [2,3,4]]
%combinari de lista luate cate N
%comb(l1, l2, ..., ln, K) : -[], n = 0
%							-l1 + comb(l2, ..ln, k-1), k > 0
%							-comb(l2, ...ln, k), k > 0
%							
%flow model(i,i,o)
%comb(L:list, K: integer, R: list)

comb(_, 0, []).
comb([H|T], K, [H|RT]) :- K > 0, NewK is K -1,  comb(T, NewK, RT).
comb([_|T], K, R) :- K > 0, comb(T, K, R).

getComb(L, K, R) :- findall(R1, comb(L, K, R1), R).