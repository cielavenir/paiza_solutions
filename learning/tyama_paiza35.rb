#!/usr/bin/ruby
n,m=gets.split.map(&:to_i)
d,r=(m-1).divmod(2*n)
p 2*n*d+2*n-r