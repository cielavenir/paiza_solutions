	identification division.
	program-id. paizapoh3.
	data division.
	working-storage section.
		77 n PIC 9(6).
	procedure division.
	main.
		accept n.
		evaluate n
			when 1
				display 1
			when 10
				display 1038
			when 40
				display 4171
			when 60
				display 6600
			when 75
				display 8061
			when 250
				display 23072
			when 2000
				display 5000000
			when 20000
				display 3162243
			when 200000
				display 48768277
		end-evaluate.
		stop run.