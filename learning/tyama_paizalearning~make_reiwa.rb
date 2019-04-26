#!/usr/bin/ruby
#coding:utf-8
gets
a=$<.map(&:chomp)
puts a.repeated_permutation(2).lazy.map(&:join).take(1000).to_a
puts a.include?('令')&&a.include?('和') ? :Nice : :Bad
