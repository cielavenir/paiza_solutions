#!/usr/bin/ruby
n,m=gets.split.map &:to_i
a=n.times.map{gets.chomp.bytes}
f = a==a.reverse||a==a.map(&:reverse)
g = a==a.reverse.map(&:reverse)
puts f&&g ? 'line point symmetry' : f ? 'line symmetry' : g ? 'point symmetry' : 'none'
