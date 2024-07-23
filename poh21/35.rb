#!/usr/bin/ruby
puts `dd`.split.map(&:to_i).each_cons(2).any?{|a,b|(a-b).abs>=3}?:Yes: :No
