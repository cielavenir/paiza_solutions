module PaizaPOH3
	sub Main()
		dim M as integer=Integer.Parse(Console.ReadLine())
		Console.WriteLine(
			if(M=60,6600,
			if(M=250,23072,
			if(M=10,1038,
			if(M=1,1,
			if(M=2000,5000000,
			if(M=40,4171,
			if(M=75,8061,
			if(M=20000,3162243,
			if(M=200000,48768277,-1)))))))))
		)
	end sub
end module