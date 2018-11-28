(defun mymerge(left right)
	(
		cond
			(
				(and (null left) (null right))
				nil
			)
			(
				(null left) 
				right
			)
			(
				(null right)
				left
			)
			(
				(<= (car left) (car right))
				(cons (car left) (mymerge (CDR left) right))
			)
			(
				T
				(cons (car right) (mymerge left (CDR right)))
			)
	)
)

(write(mymerge '(1 2 5) '(3 6 1)3))