#!/usr/bin/ruby
q=gets.to_i.times.map{
	gets.split.map(&:to_i)
}
gets.to_i.times{
	c,a=gets.split.map(&:to_i)
	d=a/q[c-1][1]
	p a*q[c-1][0]-d*q[c-1][2]
}
