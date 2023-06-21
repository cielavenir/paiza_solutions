#!/usr/bin/ruby
s=gets.chomp
puts s.size>=6 &&
	(s.chars.any?{|c|('a'..'z').include? c} || s.chars.any?{|c|('A'..'Z').include? c}) &&
	s.chars.any?{|c|('0'..'9').include? c} &&
	s.scan(/(.)\1\1/).empty? ? :Valid : :Invalid
