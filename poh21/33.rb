#!/usr/bin/ruby
n,*a=`dd`.split.map &:to_i
x,y=a.minmax
p y-x
