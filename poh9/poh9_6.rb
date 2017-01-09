#!/usr/bin/ruby
n=gets.to_i
a=gets.split.map(&:to_i)
b=gets.split.map(&:to_i)
b.each{|e|
	puts a.map{|f|e+f}*' '
}
