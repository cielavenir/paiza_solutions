#!/usr/bin/ruby
SIZES=%w(SS S M L LL)
n=gets.to_i
v=gets.split.map &:to_i
v.unshift v[0]/2
v.push v[-1]*2
r=0
n.times{r+=v[SIZES.index gets.chomp]}
p r
