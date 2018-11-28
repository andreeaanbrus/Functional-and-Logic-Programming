(defun minim(myList minNr) 
	; (SETQ minNr (CAR myList))
		(cond
		(
			(null myList)
			minNr	
		)
		(
			(<= (car myList) minNr)
			(minim (CDR myList) (CAR myList))
		)
		(
			T
			(minim (CDR myList) minNr)
		)
		)
)

(write(minim '(7 3 4 1) 10000))