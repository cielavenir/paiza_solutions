#!/usr/bin/ruby
n=100
m=100000
r=0
(0...n).each{|x|(0...n-x).each{|y|
if x**3+y**3<m
r=[r,x*y].max
end
}}
p r
