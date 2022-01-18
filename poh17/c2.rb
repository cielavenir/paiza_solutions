#!/usr/bin/ruby
s=gets.chomp.chars.map(&:to_i)
gets.to_i.times{
	x,y=gets.split.map{|e|e.to_i-1}
	(x..y).each{|i|s[i]^=1}
}
puts s*''
