#!/usr/bin/ruby
h = {}
1.upto(gets.to_i){|i|h[gets.chomp] = i}
gets.to_i.times{p h[gets.chomp]}
