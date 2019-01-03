; 3. Define a function to tests the membership of a node in a n-tree represented as (root
; list_of_nodes_subtree1 ... list_of_nodes_subtreen)
; Eg. tree is (a (b (c)) (d) (E (f))) and the node is "b" => trues

(defun isMember (L e)
	(cond
		(
			(equal L e)
			T
		)
		(
			(atom L)
			nil
		)
		(
			T
			(some #'(lambda (A) (if (equal T A) T nil)) (mapcar #'(lambda (B) (isMember B e)) L))
		)
	)
)
(print (isMember '(1) '1))
(print (isMember '(6 (5 (4)) (3)(2 (1))) 10))