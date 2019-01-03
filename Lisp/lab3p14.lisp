; ; 14. Write a function that returns the number of atoms in a list, at any level.
(defun noOfAtoms (L)
	(cond
		(
			(null L)
			0
		)
		(
			(atom (car L))
			(+ 1 (noOfAtoms (cdr L)))
		)
		(
			(listp (car L))
			(+ (noOfAtoms (car L)) (noOfAtoms (cdr L)))
		)
	)
)

(defun noOfAtomsMap (L)
	(cond
		(
			(atom L)
			1
		)
		(
			(apply '+ (mapcar 'noOfAtomsMap L))
		)
	)
)

(print (noOfAtomsMap '(1 (((2))) 2 3 4)))