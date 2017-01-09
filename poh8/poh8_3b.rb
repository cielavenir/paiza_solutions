#!/usr/bin/ruby
n,m=gets.split.map(&:to_i)
n-=m
p n>0 ? n : 0