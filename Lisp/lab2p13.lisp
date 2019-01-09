; 13. For a given tree of type (2) return the path from the root node to a certain given node X.

(defun isInSubtree (subtree node)
	(cond
		(
			(null subtree)
			nil
		)
		(
			(equal (car subtree) node)
			t
		)
		(
			(listp (car subtree))
			(or (isInSubtree (car subtree) node) (isInSubtree (cdr subtree) node))
		)
		(
			(isInSubtree (cdr subtree) node)
		)
	)
)

; (print (isInSubtree '(A (B) (C (D) (E))) 'X))

(defun findPath (tree node)
	(cond
		(
			(null tree)
			nil
		)
		(
			(equal (car tree) node)
			(list node)
		)
		(
			(isInSubtree (car (cdr tree)) node)
			(cons (car tree) (findPath (car (cdr tree)) node))
		)
		(
			(cons (car tree) (findPath (car (cdr (cdr tree))) node))
		)
	)

)

(print (findPath '(A (B) (C (D) (E))) 'D))
(print (findPath '(A (B (1 (2))) (C (D) (E (F) (G (H) (I))))) 'I))

