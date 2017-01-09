#!/usr/bin/ruby
gets
h=Hash.new(0)
gets.chomp.chars{|c|h[c]+=1}
g=Hash.new(0)
gets.chomp.chars{|c|g[c]+=1}
p g.keys.map{|k|n=g[k]-h[k];n>0 ? n : 0}.reduce(:+)