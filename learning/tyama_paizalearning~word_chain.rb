#!/usr/bin/ruby
require 'set'
n,k,m=gets.split.map &:to_i
lst=Set.new k.times.map{gets.chomp}.select{|e|!e.end_with?('z')}
already=Set.new
ret=[*1..n]
prev=nil
c=0
m.times{
	s=gets.chomp
	if lst.include?(s) && (!prev||prev[-1]==s[0]) && !already.include?(s)
		prev=s
		c+=1
		already.add(s)
	else
		prev=nil
		ret.delete_at(c)
	end
	c%=ret.size
}
p ret.size,*ret
