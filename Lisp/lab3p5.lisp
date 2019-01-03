; 5. Write a function that computes the sum of even numbers and the decrease the sum of odd numbers,
; at any level of a list.

(defun sumEvenOdd (L)

	(cond
		(
			(and (numberp L) (= 0 (mod l 2)) )
			L
		)
		(
			(and (numberp L) (= 1 (mod l 2)))
			(- 0 L)
		)
		(
			(atom L)
			0
		)
		(
			(apply '+ (mapcar 'sumEvenOdd L))
		)
	)
)

(print (sumEvenOdd '(1 2 (3 8) ((4)) 5)))
