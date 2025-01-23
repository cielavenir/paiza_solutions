#!/usr/bin/ruby
H,W,N=gets.split.map &:to_i
T=H.times.map{gets.split.map &:to_i}
R=[0]*N
r=0
gets.to_i.times{
	a,b,c,d=gets.split.map{|e|e.to_i-1}
	if T[a][b] == T[c][d]
		R[r]+=2
	else
		r=(r+1)%N
	end
}
p *R
