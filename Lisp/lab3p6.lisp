; 6. Write a function that returns the maximum of numeric atoms in a list, at any level.

(defun maximumNumericAtoms (l)
	(cond
		(
			(numberp l)
			l		
		)
		(
			(apply 'max (mapcar 'maximumNumericAtoms l))
		)
	)
)

(print (maximumNumericAtoms '(1 2 3 (4 3) ((10)))))