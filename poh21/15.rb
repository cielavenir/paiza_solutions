#!/usr/bin/ruby
n,k,*a=`dd`.split.map &:to_i
b=[0]
a.each{|e|b<<b[-1]+e}
p (0..n-k).map{|i|b[i+k]-b[i]}.max
