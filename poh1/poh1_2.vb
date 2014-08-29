module PaizaPOH1
	dim SIZE as integer=9999999
	dim z(SIZE) as byte
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
		dim n as integer=myget()
		dim d as integer=myget()
		dim zv(1000000) as integer
		dim v(n-1) as integer

		for i as integer=0 to n-1
			zv(myget())+=1
		next
		dim x as integer=0
		for j as integer=0 to 1000000
			for k as integer=0 to zv(j)-1
				v(x)=j
				x+=1
			next
		next
		for i as integer=0 to d-1
			dim m as integer=myget()
			dim idx as integer=Array.BinarySearch(v,m-v(0)+1)
			if idx<0
				idx=not idx
			end if
			dim r as integer=0
			dim j as integer=0
			dim k as integer=idx-1
			while r<m andalso j<k andalso v(j)+v(j+1)<=m
				while v(j)+v(k)>m
					k-=1
				end while
				if r<v(j)+v(k)
					r=v(j)+v(k)
				end if
				j+=1
			end while
			Console.WriteLine(r)
		next
	end sub
end module