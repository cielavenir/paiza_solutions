#!/usr/bin/ruby
s=gets.chomp
p (1..s.size-2).map{|i|
(s[0,i].to_i-s[i..-1].to_i).abs
}.min
