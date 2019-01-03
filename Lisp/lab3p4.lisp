; 4. Write a function that returns the product of numeric atoms in a list, at any level.
(defun productList (L)
	(cond
		(
			(numberp L)
			L
		)
		(
			(atom L)
			1
		)
		(
			T
			(apply '* (mapcar 'productList L))
		)
	)
)

(print (productList '(1 2 3 4 a)))