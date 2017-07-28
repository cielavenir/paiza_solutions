#!/usr/bin/env gosh
(define run (lambda (a i cur r T N)
	(if (< i N)
		(let ((val (read)))
			(vector-set! a i val)
			(let ((nxt (if (< i T) (+ cur val) (- (+ cur val) (vector-ref a (- i T))))))
				(run a (+ i 1) nxt (max r nxt) T N)
			)
		)
		r
	)
))
(let ((T (read)) (N (read)))
	(let ((a (make-vector N)))
		(write (run a 0 0 0 T N))
		(newline)
	)
)
