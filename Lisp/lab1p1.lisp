; 1.
; 1.
; a) Write a function to return the n-th element of a list, or NIL if such an element does not exist.
; b) Write a function to check whether an atom E is a member of a list which is not necessarily linear.
; c) Write a function to determine the list of all sublists of a given list, on any level.
;  A sublist is either the list itself, or any element that is a list, at any level. Example:
;  (1 2 (3 (4 5) (6 7)) 8 (9 10)) => 5 sublists :
;  ( (1 2 (3 (4 5) (6 7)) 8 (9 10)) (3 (4 5) (6 7)) (4 5) (6 7) (9 10) )
; d) Write a function to transform a linear list into a set.


;a)
; nelem(l1 ... ln, e) :- if  n = 0 -> NIL
; 					 - if e = 0 -> l1
; 					 - nelem(l2, .. ln, e-1)
; first elem is l0

(defun nelem (l e) 
	(
		cond 
		(
			(null l)
			NIL
		)
		(
			(eq e 0)
			(car l)
		)
		(
			T
			(nelem (cdr l) (- e 1))
		)
	)
)
; (write (nelem '(1 2 3 7 5 8) 1))
; (write (nelem '(1 2 3 7 5 8) 5))
; (write (nelem '(1 2 3 7 5 8) 0))
; (write (nelem '(1 2 3 7 5 8) 10))

;b) atom e is member of list
; checkatom(l1, ... ln, E) :- if n = 0 -> false
; 						- if l1 = E -> true
; 						- if l1 is list -> checkatom(l1, E)
; 						- else -> checkatom(l2, ... ln, E)

(defun checkatom (l e)
	(cond
		(
			(null l)
			nil
		)
		(
			(eq (car l) e)
			t
		)
		(
			(listp (car l))
			(checkatom (car l) e)
		)
		(
			t
			(checkatom (cdr l) e)
		)
	)
)

; (write(checkatom '(1 2 (2) 5 6) 3))
; (write(checkatom '(1 2 (3) 5 6) 3))
; (write(checkatom '(1 2 3 5 6) 3))

; sublistSet(l1...ln) - if n = 0 -> nil
; 					- if l1 is list print l1 and sublistSet(l1), sublistSet(l2...ln)
					; - else sublistSet(l2...ln)

(defun sublistSet (l)
	(cond
		(
			(null l)
			nil
		)
		(
			(listp (car l))
			(write (car l))
			(sublistSet (car l))
			(sublistSet (cdr l))
		)
		(
			(listp (cdr l))
			(sublistSet (cdr l))
		)
	)
)

; (write (sublistSet'(1 2 (3 (4 5) (6 7)) 8 (9 10))))

; d) set(l1..ln) - if n = 0 -> []
				 ; - if l1 is not in the rezList -> add it
				 ; - otherwise -> set (l2 ...ln)


(defun myset (l) 
	( cond
		(
			(null l)
			nil
		)
		(
			T 
			(setq rezList (myset (cdr l)))
			( cond
				(
					(checkatom rezList (car l))
					rezList
				)
				(
					T
					(cons (car l) rezList)
				)
			)
			
		)
	)
)

(write (myset '(1 1 1 1 2 3 1 2 3)))
(write (myset '(1 1 1 1 )))
(write (myset '(1 2 3 4 5)))