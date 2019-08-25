#!/usr/bin/ruby
n=gets.to_i
puts n<20 ? :no : n<=15000 ? :yes : n<=20000 ? 'not sure' : :no
