#!/usr/bin/ruby

# 隣り合った部屋にしか移動できないなら多分これで合っとる
n,m=gets.split.map &:to_i
a,b=m.times.map{
	gets.split.map &:to_i
}.transpose.map{|e|
	f=Hash[*e.sort.each_with_index.flat_map{|e,i|[e,i]}]
	e.map{|x|f[x]}
}
# p a
# p b
puts a==b ? :No : :Yes
