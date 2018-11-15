%a. Write a predicate to determine the lowest common multiple of a list formed from integer numbers.
cmmdc(N1, N2, N2) :- X is N1 mod N2, X =:= 0.
cmmdc(N1, N2, R) :- X is N1 mod N2, X =\= 0, cmmdc(N2, X, R).

lcmlist([],1).
lcmlist([H|T], R) :- lcmlist(T, RT),
    	Prod is H * RT,
    	cmmdc(H, RT, Rez), 
    	R is Prod div Rez.
%b. Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th, … element in a list.

isPow(1, _).
isPow(Y, X) :- Rez is Y mod X, 
    			Rez =\= 0
    			->  false.
isPow(Y, X) :- Rez is Y mod X, 
    			Rez =:= 0, 
    			NewY is Y div X,
    			isPow(NewY, X).


addPower([], V, Y,[V]) :- isPow(Y, 2).
addPower([], _, Y, []) :- not(isPow(Y, 2)).
addPower([H|T], V, X, [H, V|RT]) :- isPow(X,2), 
    								NewX is X + 1, 
    								addPower(T, V, NewX, RT).

addPower([H|T], V, X, [H|RT]) :- not(isPow(X,2)), 
    								NewX is X + 1, 
    								addPower(T, V, NewX, RT).