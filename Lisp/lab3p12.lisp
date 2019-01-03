; 12. Write a function that substitutes an element through another one at all levels of a given list.
(defun substitute1(L e1 e2)
	(
		cond
		(
			(null L)
			nil
		)
		(
			(listp (car L))
			(cons (substitute1 (car L) e1 e2) (substitute1 (cdr L) e1 e2))
		)
		(	
			(and (atom (car L)) (= e1 (car L)))
			(cons e2 (substitute1 (cdr L) e1 e2))
		)
		(
			T
			(cons (car L) (substitute1 (cdr L) e1 e2))
		)
	)
)
(print (substitute1 '(1 (1 2) (2 3) 1 2 3) 1 2))

(defun substituteMap (L e1 e2)
	(
		cond
		(
			(equal L e1)
			e2
		)
		(
			(atom L)
			L
		)
		(
			T
			(apply 'list (mapcar #'(lambda (A) (substituteMap A e1 e2)) L))
		)
	)
)
(print (substituteMap '(1 (1 2) (2 3) 1 2 3) 1 2))
