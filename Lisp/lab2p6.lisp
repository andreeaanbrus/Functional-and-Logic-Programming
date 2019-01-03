; 8. Return the list of nodes of a tree of type (2) accessed inorde

; inorder(l1...ln) : [l1] ,if l1 is leaf
; 					[a, l1, b]	,else where a is inorder(l2) and b is (l3)

(defun inorder (tree)
	(cond
		(
			(null ( cdr tree)) ;leaf
			; (print (car tree))
			(list (car tree))
		)
		(
			T
				(   append
					(inorder (car (cdr tree)))
					(list(car tree))
					(inorder (car (cdr (cdr tree))))
				)
		)
	)
)

(print (inorder '(A(B)(C(D)(E)))))