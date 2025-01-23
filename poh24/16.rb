#!/usr/bin/ruby
puts (1..gets.to_i).all?{s=gets.chomp;s==s.reverse} ? :Yes : :No
