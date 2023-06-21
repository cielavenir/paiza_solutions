#!/usr/bin/ruby
N,A,B=gets.split.map &:to_i
(A..B).map{|e|puts'%0*d'%[N,e]}
