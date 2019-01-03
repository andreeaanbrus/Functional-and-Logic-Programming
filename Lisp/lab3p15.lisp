; 15. Write a function that reverses a list together with all its sublists elements, at any level.

(defun reverseSimple (L)
	(cond
		(
			(null L)
			nil
		)
		(
			(listp (car L))
			(cons (reverseSimple (cdr L)) (reverseSimple (car L)))
		)
		(
			T 
			(cons (reverseSimple (cdr L) ) (cons(car L) nil))
		)
	)
)

(print (reverseSimple '(1 2 ( 3(10) 5) 3 4)))

(defun reverseMap (L)
	(cond
		(
			(listp L)
			(reverse (mapcar 'reverseMap L))
		)
		
		(
			T
			L
		)
	)
)
(print (reverseMap '(1 2 ( 3(10) 5) 3 4)))