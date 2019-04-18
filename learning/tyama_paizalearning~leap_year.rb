#!/usr/bin/ruby
def leap(y)
	return true if y%400==0
	return nil if y%100==0
	y%4==0
end
puts leap(gets.to_i) ? :Yes : :No
