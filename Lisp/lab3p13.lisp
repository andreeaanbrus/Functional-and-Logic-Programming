; 13. Define a function that returns the depth of a tree represented as (root list_of_nodes_subtree1 ...
; list_of_nodes_subtreen)
; Eg. the depth of the tree (a (b (c)) (d) (e (f))) is 3

(defun depthTree (tree)
	(cond
		(
			(atom tree)
			0
		)
		(
			T
			(+ 1 (apply 'max(mapcar 'depthTree tree)))
		)
	)
)
(print (depthTree '(A (B (C)) (D) (E (F)))))