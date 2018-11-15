pred([H|[]], 1, [9]) :- H =:= 0.
pred([H|[]], 0, [H1]) :- H =\= 0, H1 is H - 1.
pred([H|T], 0, [H|R]) :- pred(T, C, R), C =:= 0.
pred([H|T], 0, [H1|R]) :- pred(T, C, R), C =:= 1, H =\= 0 ,H1 is H - 1.
pred([H|T], 1, [9|R]) :- pred(T, C, R), C =:= 1, H =:=0.

hetero([], []).
hetero([H|T], [R|R1]) :- is_list(H), pred(H,_, R), hetero(T,R1).
hetero([H|T], [H|R]) :- hetero(T, R).