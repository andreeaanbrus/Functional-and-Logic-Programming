; a) Write a function that inserts in a linear list a given atom A after the 2nd, 4th, 6th, ... element.
(defun insertEven (elem l poz)
	(cond
		(
			(null l)
			nil
		)
		(
			(= 0 (mod poz 2))
			(cons (car l) (cons elem (insertEven elem (cdr l) (+ poz 1))))
		)
		(
			(cons (car l) (insertEven elem (cdr l) (+ poz 1)) )
		)
	)
)

; (print (insertEven 'A '(1 2 1 2 1 2) 1))

; Write a function to get from a given list the list of all atoms, on any
;  level, but reverse order. Example:
;  (((A B) C) (D E)) ==> (E D C B A)

(defun reverseAtoms(l)
	(cond
		(
			(null l)
			nil
		)
		(
			(atom (car l))
			(cons (reverseAtoms (cdr l)) (car l))
		)
		(
			(listp (car l))
			(cons (reverseAtoms (cdr l)) (reverseAtoms (car l)))
		)
	)
)

; (print (reverseAtoms '(1 ((2) 3) 4)))

; c) Write a function that returns the greatest common divisor of all numbers in a nonlinear list

(defun mygcd (a b)
	(cond
		(
			(= b 0)
			a
		)
		(
			T
			(mygcd b (mod a b))
		)
	)
)
(print (mygcd 4 1))

(defun listGCD (l)
	(cond
		(
			(null  l)
			0
		)
		(
			(listp (car l))
			(mygcd (listGCD (car l)) (listGCD (cdr l)))
		)
		(

			(mygcd (car l) (listGCD(cdr l)))	
		)

	)
)

(print (listGCD '(4 (16 (24 32)) 4 )))

; d) Write a function that determines the number of occurrences of a given atom in a nonlinear list.
(defun occurrences(l elem)
	(cond
		(
			(null l)
			0
		)
		(
			(listp (car l))
			(+ (occurrences (car l) elem) (occurrences (cdr l) elem))
		)
		(
			( = (car l) elem)
			(+ 1 (occurrences (cdr l) elem))
		)
		(
			T
			(occurrences (cdr l) elem)
		)
	)
)
; (print (occurrences '(1 2 3 (1 (1) 2) 2) 9))