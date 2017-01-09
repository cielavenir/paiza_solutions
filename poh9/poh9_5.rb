#!/usr/bin/ruby
a=gets.split.map(&:to_i)
if gets.chomp=='decode'
	b=[]
	10.times{|i|b[a[i]]=i}
	a=b
end
puts gets.chomp.chars.map{|e|a[e.to_i]}*''
