elim([_], []).
elim([_|T], T).
%%merge
merge([], [], []).
merge(L, [], L).
merge([], L, L).
merge([H, H|T1],L, R) :- elim([H, H|T1], Rez), merge(Rez, L, R).
merge(L, [H2, H2|T2], R) :- elim([H2, H2|T2], Rez), merge(L, Rez, R).
merge([H|T1], [H|T2], [H|R]) :- merge(T1, T2, R).
merge([H1|T1], [H2|T2], [H1|RT]) :- H1 < H2, merge(T1, [H2|T2], RT).
merge([H1|T1], [H2|T2], [H2|RT]) :- H1 > H2, merge([H1|T1], T2, RT).

heteromerge([],[]).
heteromerge([H|T], R) :- number(H), heteromerge(T, R).
heteromerge([H|T], R) :- is_list(H),heteromerge(T, Rez1), merge(H, Rez1, R) .