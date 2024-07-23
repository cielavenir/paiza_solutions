#!/usr/bin/ruby
n,k=gets.split.map &:to_i
a=n.times.map{gets.to_i}
b=[0]
a.each{|e|b<<b[-1]+e}
k.times{p b[gets.to_i]}
