#!/usr/bin/ruby
n,x,*a=ARGF.read.split.map &:to_i
p x-(1<<n).times.map{|i|
	bits=0
	s=0
	n.times{|j|bits+=i[j];s+=a[j] if i[j]>0}
	[bits,s]
}.filter{|bits,s|
	s<=x
}.max[1]
