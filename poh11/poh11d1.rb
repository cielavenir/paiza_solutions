#!/usr/bin/ruby
a,b,c,d=`dd`.split.map(&:to_i)
p a*d>c*b ? b : d
