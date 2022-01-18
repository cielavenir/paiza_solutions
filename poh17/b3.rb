#!/usr/bin/ruby
n,t=gets.split.map &:to_i
a=n.times.map{gets.split.map &:to_i}
r=0
while t!=0
	r+=a[t-1][1]
	t=a[t-1][0]
end
p r
