#!/usr/bin/ruby
gets
puts$<.map{|e|
	a,b=e.split.map{|e|'gcp'.index e}
	[
		[0,0],
		[0,1],
		[1,0],
	][(a-b)%3]
}.transpose.map &:sum
