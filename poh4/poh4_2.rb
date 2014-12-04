#!/usr/bin/ruby
p gets.to_i.times.map{
	t,s,p=gets.split.map(&:to_i)
	p*[t-s,0].max
}.reduce(:+)