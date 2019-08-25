#!/usr/bin/ruby
a,b=gets.split.map &:to_i
puts a==b ? 0 : '%+d'%(b-a)
