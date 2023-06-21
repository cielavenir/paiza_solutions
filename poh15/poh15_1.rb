#!/usr/bin/ruby
H,W,N=gets.split.map &:to_i
R=H.times.map{[0]*W}
A=N.times.map{|i|
	[i+1]+gets.split.map(&:to_i)
}.select{|e|
	e[1]<=H && e[2]<=W
}.sort_by{|e|
	e[1]*e[2]
}
a=A[-1]
a[1].times{|i|a[2].times{|j|R[i][j]=a[0]}}
puts R.map{|e|e*' '}
