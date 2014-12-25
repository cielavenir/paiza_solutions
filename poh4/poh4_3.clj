#!/usr/bin/env clj
(defn run [a i cur r T N]
	(if (< i N)
		(let [val (read)]
			(aset ^ints a i val)
			(let [nxt (if (< i T) (+ cur (aget ^ints a i)) (- (+ cur (aget ^ints a i)) (aget ^ints a (- i T))))]
				(recur a (+ i 1) nxt (max r nxt) T N)
			)
		)
		r
	)
)
(let [T (read) N (read)]
	(def a (int-array N))
	(println (run a 0 0 0 T N))	
)