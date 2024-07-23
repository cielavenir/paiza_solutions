#!/usr/bin/ruby
h=Hash.new(0)
gets
gets.split.each{|e|h[e.to_i]+=1}
puts 10.times.map{|i|h[i]}*' '
