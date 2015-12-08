#!/usr/bin/ruby
x=y=0.0
gets.to_i.times{
	t,s=gets.split.map(&:to_i)
	if t==1
		x+=s
	elsif t==2
		y+=s
	else
		x,y=x-s*x/(x+y),y-s*y/(x+y)
	end
}
p (100*y/(x+y)).to_i