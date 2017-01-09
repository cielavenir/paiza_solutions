#!/usr/bin/ruby
a,b,c=gets.split
p a.to_i.send(c.to_sym,b.to_i)
