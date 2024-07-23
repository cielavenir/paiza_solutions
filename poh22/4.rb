#!/usr/bin/ruby
B=[17043521,1118480]+(0..4).flat_map{[31<<_1*5,1082401<<_1]}
A=ARGF.read
puts [?O,?X].find{|e|B.any?{|b|A.gsub(/./m){_1=="\n"?"":e==_1 ??1:?0}.to_i(2)&b==b}}||'D'
