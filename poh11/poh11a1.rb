#!/usr/bin/ruby
n=gets.to_i;s=gets.chomp
a=[]
(1..n).each{|i|a.send(s[i-1]==?L ? :unshift : :push,i)}
puts a*' '