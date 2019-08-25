#!/usr/bin/ruby
d,s=gets.split.map &:to_i
puts d*100000/s>=10000 ? :yes : :no
