#!/usr/bin/ruby
n,b,*a=`dd`.split.map &:to_i
puts a.include?(b)?:Yes: :No
