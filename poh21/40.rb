#!/usr/bin/ruby
n,m,*a=`dd`.split.map(&:to_i)
p a.count(n)
