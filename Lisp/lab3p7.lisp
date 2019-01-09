; 7. Write a function that substitutes an element E with all elements of a list L1 at all levels of a given list L
(defun subsituteList (l e l1)
	(cond
		(
			(null l)
			nil
		)
		(
			(listp (car l))
			(cons (subsituteList (car l) e l1) (subsituteList (cdr l) e l1))
		)
		(
			(equal (car l) e)
			(cons l1 (subsituteList (cdr l) e l1))
		)
		(
			(/= (car l) e)
			(cons (car l) (subsituteList (cdr l) e l1))
		)
	)

)
(print (subsituteList '(1 2 (2 3 (2))) 2 '(10 (10))))


(defun subsituteListMap (l e l1)
	(cond
		(
			(equal l e)
			l1
		)
		(
			(atom l)
			l
		)
		(
			T
			(apply 'list (mapcar #'(lambda (A) (subsituteListMap A e l1)) l))
		)
	)
)
(print (subsituteListMap '(1 2 (2 3 (2))) 2 '(10 (10))))