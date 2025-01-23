#!/usr/bin/ruby
n,m,*a=ARGF.read.split.map &:to_i
puts a.map{|e|
	if e<n
		n
	else
		[(e+n-1)/n*n,e/n*n].min_by{|x|(x-e).abs}
	end
}
