; a) Write a function to return the product of two vectors.
(defun dotProd (a b)
	(cond
		(
			(numberp a)
			(* a b)	
		)
		(
			T
			(apply '+ (mapcar 'dotProd a b))
		)
	)
)

; (write (dotProd '( 1 2 3) '(4 5 1)))

; b) Write a function to return the depth of a list. Example: the depth of a linear list is 1.

(defun depthList (l)
	(cond
		(
			(null l)
			1
		)
		(
			(listp (car l))

			(+ (depthList (car l)) (depthList (cdr l)))

		)
		(
			T
			(depthList (cdr l))
		)
	)
)
; (print (depthList '(1 2 3 4)))
; (print (depthList '(1 2 3 (2 (3 (4)())) 4)))

; c) Write a function to sort a linear list without keeping the double values.

(defun insertValue (elem l)
	(cond
		(
			(null l)
			(cons elem nil)
		)
		(
			(> (car l) elem)
			(cons elem l)
		)
		(
			(= (car l) elem)
			l
		)
		(
			T
			(cons (car l) (insertValue elem (cdr l)))
		)
	)
)

(defun mySort (l)
	(cond
		(
			(null l)
			nil
		)
		(
			T
			(insertValue (car l) (mySort (cdr l)))
		)
	)
	
	
)
; (print(mySort '(8 3 3 3 3 3 8 6 7 1 2)))

; d) Write a function to return the intersection of two sets.
(defun myIntersection(l1 l2)
	(cond
		(
			(null l1)
			l2
		)
		(
			T
			(insertValue (car l1) (myIntersection (cdr l1) l2))
		)
	)
) 

(print (myIntersection '(1 3 5) '(2 4 7)))