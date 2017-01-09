#!/usr/bin/ruby
n,a,m,b=`dd`.split.map(&:to_i)
p n*a+(n+m-1)/m*b