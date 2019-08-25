#!/usr/bin/ruby
n=gets.to_i
puts n<30 ? :quiet : n<50 ? :normal : n<70 ? :noisy : 'very noisy'
