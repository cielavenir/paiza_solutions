#!/usr/bin/ruby
n,*a=`dd`.split.map &:to_i
a.each{|e|puts a.map{|f|e*f}*' '}
