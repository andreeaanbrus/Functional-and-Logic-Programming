;3. Return the number of levels of a tree of type (1).
;(A 2 B 0 C 2 D 0 E 0) -> level 3
(defun getLevel (tree)
	(
		cond 
		(
			(null tree)
			1
		)
		(
			(numberp (CAR tree))
			(
				cond
				(
					(/= 0 (car tree))
					(+ 1  (getLevel (CDR tree)))

				)
				(
					t
					(getLevel (CDR tree))
				)
			)
		)
		(
			t
			(getLevel (CDR tree))
		)

	)
)

(write(getLevel '(A 2 B 0 C 2 D 0 E 0)))
(write(getLevel '(A 1 B 2 C 1 D 1 E 0 F 0)))