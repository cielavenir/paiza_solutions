#!/usr/bin/ruby
x,y,z=gets.split.map &:to_i
h={};g={}
x.times{a,b=gets.split.map &:to_i;h[a]=b}
y.times{a,b=gets.split.map &:to_i;g[a]=b}
(1..x).each{|i|puts [i,g[h[i]]]*' '}
