; 9. Write a function that removes all occurrences of an atom from any level of a list.
(defun removeOc (l e)
	(cond
		(
			(null l)
			nil
		)
		(
			(listp (car l))
			(cons (removeOc (car l) e) (removeOc (cdr l) e))
		)
		(
			(equal (car l) e)
			(removeOc (cdr l) e)
		)
		(
			T
			(cons (car l) (removeOc (cdr l) e))
		)
	)
)

(print (removeOc '(1 2 3 (4 5 2 (2 (2 3)))) 2))


(defun removeOcMap (l e)
	(cond
		(
			(equal l e)
			nil
		)
		(
			(atom l)
			l
		)
		(
			(remove nil (apply 'list (mapcar #'(lambda (A) (removeOcMap A e)) l)))
		)
	)
)

(print (removeOcMap '(1 2 3 (4 5 2 (2 (2 3)))) 2))