; 2. Write a function that returns the sum of numeric atoms in a list, at any level.

(defun suma (L)

	(cond
		(
			(numberp L)
			L
		)
		
		( 
			T
			(apply '+ (mapcar 'suma L))
		)
	)
)

(print(suma '(1 ((2) 3) 4 5)))