#!/usr/bin/ruby
H,W=gets.split.map &:to_i
M=H.times.map{gets.split}
puts M.transpose.map{|e|e*' '}
