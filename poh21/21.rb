#!/usr/bin/ruby
n,k,x=gets.split.map &:to_i
a=([x]+n.times.map{gets.to_i}).sort
r=a.index(x)+1
k.times{
s=gets.chomp
if s=='sorting'
p r
elsif s.split[1].to_i<x
r+=1
end
}
