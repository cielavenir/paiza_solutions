#!/usr/bin/ruby
x,y,a,b=`dd`.split.map &:to_i
puts [[(a*x-b*y)/a,:Player],[(b*y-a*x)/b,:Enemy]].max.reverse
