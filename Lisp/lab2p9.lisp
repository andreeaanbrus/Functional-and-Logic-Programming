; 9. Convert a tree of type (1) to type (2).

(defun getV (lst)
	(car lst)
)
(defun getN(lst)
	(car(cdr lst))
)

(defun convert (tree)
	(cond
		(
			(= 0 (car(cdr tree)))
			(list(car tree))
		)
		(
			(= 1 (car (cdr tree)))
			(list (getV tree) (convert (cddr tree)))
		)
		(
			(= 2 (car (cdr tree)))
			(list (getV tree) (convert (cddr tree)) (convert (cddr (cddr tree))))
		)
	)
)

(print(convert '(A 2 B 0 C 0)))
(print(convert '(A 2 B 0 C 2 D 0 E 0)))
(print(convert '(A 2 B 2 C 1 D 0 E 0 F 0)))