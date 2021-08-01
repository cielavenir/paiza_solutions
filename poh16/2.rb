#!/usr/bin/ruby
n,k,*a=$<.read.tr('.','').split.map &:to_i
#p a.map{|e|(e+k-1)/k}.sum
p (a.sum+k-1)/k
