module PaizaPOH5_4b
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
		dim W as integer=myget()
		dim H as integer=myget()
		dim Q as integer=myget()
		dim m(H,W) as integer
		dim imos(H+1,W+1) as integer
		for i as integer=0 to H-1
			for j as integer=0 to W-1
				m(i,j)=myget()
			next
		next
		dim s as integer
		for i as integer=0 to Q-1
			dim w1 as integer=myget()-1
			dim h1 as integer=myget()-1
			dim w2 as integer=myget()
			dim h2 as integer=myget()
			imos(h1,w1)+=1
			imos(h1,w2)-=1
			imos(h2,w1)-=1
			imos(h2,w2)+=1
		next
		for i as integer=0 to H-1
			for j as integer=1 to W-1
				imos(i,j)+=imos(i,j-1)
			next
		next
		for i as integer=1 to H-1
			for j as integer=0 to W-1
				imos(i,j)+=imos(i-1,j)
			next
		next
		for i as integer=0 to H-1
			for j as integer=0 to W-1
				if imos(i,j)>0
					s+=m(i,j)
				end if
			next
		next
		Console.WriteLine(s)
	end sub
end module