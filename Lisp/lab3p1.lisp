; 1. Write a function to check if an atom is member of a list (the list is non-liniar)
(defun checkAtom (L e)
	(cond 
		(
			(null L)
			nil
		)
		(
			(= (car L) e)
			t
		)
		(
			T
			(checkAtom (cdr L) e)
		)
	)
)

(defun checkAtomMap (L e)
	(cond
		(
			(equal L e)
			T
		)
		(
			(atom L)
			nil
		)
		(
			 (some #'(lambda (A) (if (equal T A) T NIL)) (mapcar #'(lambda (B) (checkAtomMap B E)) L))
		)
	)
)

(print (checkAtom '(2 2 1 2 4) 1))
(print (checkAtomMap '(2 1 3 2) 1))