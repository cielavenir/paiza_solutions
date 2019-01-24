#!/usr/bin/ruby
H,W,N=gets.split.map &:to_i
x=y=0
puts N.times.all?{
	dx,dy={'U'=>[0,1],'R'=>[1,0],'D'=>[0,-1],'L'=>[-1,0]}[gets.chomp]
	x+=dx
	y+=dy
	0<=x&&x<W && 0<=y&&y<H
} ? :valid : :invalid
