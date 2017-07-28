#!/usr/bin/ruby
h=Hash.new{|h,k|h[k]=''.dup} # Ruby3
gets.to_i.times{a,b=gets.split;h[a.to_i]<<b}
puts h.sort.map{|e|e*' '}
