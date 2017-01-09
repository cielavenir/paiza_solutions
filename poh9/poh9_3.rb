#!/usr/bin/ruby
p $<.reduce(0){|s,e|s+e.to_i}
