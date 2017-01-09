#!/usr/bin/ruby
n,m=gets.split.map(&:to_i)
puts m%n==0 ? :ok : :ng