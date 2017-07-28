#!/usr/bin/ruby
n,m,a,b,*c=`dd`.split.map(&:to_i)
c.each{|e|
	m+=e
	if e<0
		if m<0
			p -1
			break
		end
		if m<=a
			m+=b
		end
	end
}
p m
