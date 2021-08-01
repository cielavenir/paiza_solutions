#!/usr/bin/ruby
n,_,l=gets.split.map &:to_i
a=n.times.map{gets.split.map &:to_i}
p *l.times.map{
	gets.split.map &:to_i
}.each_cons(2).map{|x,y|
	z=y.zip(x).map{|a,b|a-b}
	a.index(z)+1
}
