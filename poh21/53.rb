#!/usr/bin/ruby
*a=gets.split.map &:to_i
puts [a.min,a.max]*' '
