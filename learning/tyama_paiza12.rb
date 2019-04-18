#!/usr/bin/ruby
n,m=gets.split.map(&:to_i)
x=Array.new(n)
m.times{
	a,b=gets.split.map(&:to_i)
	b-=1
	if a.times.none?{|i|x[(b+i)%n]}
		a.times{|i|x[(b+i)%n]=true}
	end
}
p x.count{|e|e}