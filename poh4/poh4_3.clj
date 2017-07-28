#!/usr/bin/env clj
(set! *unchecked-math* true)
(defn run [a i cur r T N]
	(if (< i N)
		(let [val (read)]
			(aset-long ^longs a i val)
			(let [nxt (if (< i T) (+ cur val) (- (+ cur val) (aget ^longs a (- i T))))]
				(recur a (+ i 1) nxt (max r nxt) T N)
			)
		)
		r
	)
)
(let [T (read) N (read)]
	(def a (long-array N))
	(println (run a 0 0 0 T N))
)
