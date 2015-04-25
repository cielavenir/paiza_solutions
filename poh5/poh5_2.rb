#!/usr/bin/ruby
puts gets.to_i.times.map{gets.to_i}.each_slice(7).to_a.transpose.map{|e|e.reduce(:+)}