#!/usr/bin/ruby
n,x,*d=`dd`.split.map &:to_i
d<< 0
r=[x]
(n-1).times{|i|
	d[i]-=r[-1]
	d[i+1]-=r[-1]
	r<< d[i]
}
puts r*' '
