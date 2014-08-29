module PaizaPOH2
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
	function mygetC() as integer
		input_count+=1
		return z(input_count-1)
	end function

	sub Main()
		Console.OpenStandardInput().Read(z,0,SIZE)
		dim h as integer=myget()
		dim w as integer=myget()
		dim a(h-1,w-1,h-1) as integer
		dim accum(h-1,w) as integer
		for i as integer=0 to h-1
			for j as integer=0 to w-1
				a(i,j,0)=(mygetC()-48) xor 1
			next
			mygetC()
		next
		for i as integer=0 to h-1
			accum(0,a(i,0,0))+=1
			for j as integer=1 to w-1
				if a(i,j,0)>0
					a(i,j,0)+=a(i,j-1,0)
					accum(0,a(i,j,0))+=1
				end if
			next
		next
		for i as integer=1 to h-1
			for j as integer=0 to w-1
				for k as integer=1 to i
					a(i,j,k)=Math.min(a(i-1,j,k-1),a(i,j,k-1))
					if a(i,j,k)=0
						exit for
					end if
					accum(k,a(i,j,k))+=1
				next
			next
		next
		for i as integer=0 to h-1
			for j as integer=w-1 to 0 step -1
				accum(i,j)+=accum(i,j+1)
			next
		next
		dim k as integer=myget()
		while k>0
			dim s as integer=myget()
			dim t as integer=myget()
			Console.WriteLine(if(s<=h andalso t<=w,accum(s-1,t),0))
			k-=1
		end while
	end sub
end module