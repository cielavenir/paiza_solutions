module PaizaPOH3
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
		dim M as integer=myget()
		dim N as integer=myget()
		dim num(N-1) as integer
		dim cost(N-1) as integer
		dim total as integer=0
		for j as integer=0 to N-1
			dim q as integer=myget()
			dim r as integer=myget()
			total+=q
			num(j)=q
			cost(j)=r
		next

		dim bag(total) as integer
		for i as integer=1 to total
			bag(i)=-1
		next
		for j as integer=0 to N-1
			for i as integer=total to num(j) step -1
				if bag(i-num(j))>=0 then
					if bag(i)<0 orelse bag(i)>bag(i-num(j))+cost(j) then
						bag(i)=bag(i-num(j))+cost(j)
					end if
				end if
			next
		next
		dim j as integer=-1
		for i as integer=M to total
			if j<0 orelse (bag(i)>=0 andalso j>bag(i))
				j=bag(i)
			end if
		next
		Console.WriteLine(j)
	end sub
end module