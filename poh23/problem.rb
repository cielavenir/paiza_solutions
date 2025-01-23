#!/usr/bin/ruby
T=[[0,1],[1,0],[1,1],[2,1],[1,2]]
h,w=gets.split.map &:to_i
m=h.times.map{gets.chomp}
r=0
(h-2).times{|y|(w-2).times{|x|
	r+=1 if T.all?{|i,j|
		m[y+i][x+j]=='#'
	}
}}
p r
