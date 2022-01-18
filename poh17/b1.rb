#!/usr/bin/ruby
h,w,x=gets.split.map &:to_i
x-=1;y=x;r=0
h.times{
	a=gets.split.map &:to_i
	(x..y).each{|i|r+=a[i]}
	x-=1 if 0<x
	y+=1 if y<w-1
}
p r
