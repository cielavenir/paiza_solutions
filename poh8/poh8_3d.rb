#!/usr/bin/ruby
a=[0]*24
gets.to_i.times{
	x,y=gets.split
	a[x.to_i] += y=='in' ? 5 : 3
}
r=c=0
24.times{|i|
	c+=a[i]
	if c>0
		c-=1
		r+=2
	else
		r+=1
	end
}
p r