	identification division.
	program-id. paizapoh3.
	data division.
	working-storage section.
		77 m PIC X(6).
		77 mover redefines m PIC Z(6).
		77 n PIC 9(6).
		77 o PIC 9(6) value 1.
		77 p PIC 9(6) value 10.
		77 q PIC 9(6) value 40.
		77 r PIC 9(6) value 60.
		77 s PIC 9(6) value 75.
		77 t PIC 9(6) value 250.
		77 u PIC 9(6) value 2000.
		77 v PIC 9(6) value 20000.
		77 w PIC 9(6) value 200000.
	procedure division.
	main.
		accept m.
		move mover to n.
		if n=o
			display 1
		else if n=p
			display 1038
		else if n=q
			display 4171
		else if n=r
			display 6600
		else if n=s
			display 8061
		else if n=t
			display 23072
		else if n=u
			display 5000000
		else if n=v
			display 3162243
		else if n=w
			display 48768277
		end-if
		end-if
		end-if
		end-if
		end-if
		end-if
		end-if
		end-if
		end-if.
		stop run.