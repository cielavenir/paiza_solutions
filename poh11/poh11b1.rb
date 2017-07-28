#!/usr/bin/ruby
puts ('b'+gets.chomp).chars.chunk{|e|e}.map.with_index{|(k,v),i|v.size-(i==0?1:0)}*' '
