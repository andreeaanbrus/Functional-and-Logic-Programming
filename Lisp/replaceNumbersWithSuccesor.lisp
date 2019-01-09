(defun replace1 (l)
	(cond
		(
			(null l)
			nil
		)
		(
			(listp (car l))
			(cons (replace1 (car l)) (replace1 (cdr l)))
		)
		(
			
			(and (numberp (car l)) (= 0 (mod (car l) 2)))
			(cons (+ (car l) 1) (replace1 (cdr l)))
		)
		(
			(cons (car l) (replace1 (cdr l)))
		)

	)	
)

(print(replace1 '(1 s 4 (2 f (7)))))

(defun replacemap (l)
	(cond
		(
			(and (numberp l) (= 0 (mod l 2)))
			(+ 1 l)
		)
		(
			(atom l)
			l
		)
		(
			(apply 'list (mapcar 'replacemap l))
		)
	)
)

(print (replacemap '(1 s 4 (2 f (7)))))