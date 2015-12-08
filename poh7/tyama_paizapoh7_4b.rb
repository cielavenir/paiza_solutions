#!/usr/bin/ruby
x,y,z,n=gets.split.map(&:to_i)
t=[[0,x],[0,y]]
n.times{a,b=gets.split.map(&:to_i);t[a]<<b}
p z*t.map{|e|e.sort.each_cons(2).map{|x,y|y-x}.min}.reduce(:*)