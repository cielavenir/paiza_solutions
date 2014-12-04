module PaizaPOH4
	dim SIZE as integer=9999999
	dim z(SIZE-1) as byte
	dim input_count as integer=0

	function myget() as integer
		dim r as integer
		while 48<=z(input_count) andalso z(input_count)<=57
			r=r*10+z(input_count)-48
			input_count+=1
		end while
		input_count+=1
		return r
	end function

	sub Main()
		Console.OpenStandardInput().Read(z,0,SIZE)

		dim T as integer=myget()
		dim N as integer=myget()
		dim cur as integer=0
		dim a(N-1) as integer
		for i as integer=0 to T-1
			a(i)=myget()
			cur+=a(i)
		next
		dim r as integer=cur
		for i as integer=T to N-1
			a(i)=myget()
			cur+=a(i)
			cur-=a(i-T)
			if r<cur
				r=cur
			end if
		next
		Console.WriteLine(r)
	end sub
end module