#!/usr/bin/ruby
n=gets.to_i
puts (1..n).map{|i|
	s=gets
	a=[s.count('W'),s.count('D'),s.count('L')]
	[i,a[0]*2+a[1],*a]
}.max_by{|e|e[1]}*' '
