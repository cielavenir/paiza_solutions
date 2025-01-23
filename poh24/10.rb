#!/usr/bin/ruby
n,a,b=gets.split.map &:to_i
p (1..n).min_by{
    x,y=gets.split.map &:to_i
    Math.hypot(x-a,y-b)
}
