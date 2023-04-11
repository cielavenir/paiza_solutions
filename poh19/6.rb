#!/usr/bin/ruby
prepositions = %w(at by for from in of on to)
gets
puts gets.split.each_with_index.all?{|e,i|
	if !prepositions.include?(e.downcase)
		e[0] == e[0].upcase
	elsif i==0
		e == e.capitalize
	else
		e == e.downcase
	end
} ? :Yes : :No
