#!/usr/bin/ruby
a,b,n,*x=`dd`.split.map &:to_i
puts x.map{|e|e==a ? b : e}
