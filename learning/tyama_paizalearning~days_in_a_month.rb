#!/usr/bin/ruby
def leap(y)
	return true if y%400==0
	return nil if y%100==0
	y%4==0
end
T=[0,31,28,31,30,31,30,31,31,30,31,30,31]
y,m=gets.split.map &:to_i
p m!=2 ? T[m] : leap(y) ? 29 : 28
