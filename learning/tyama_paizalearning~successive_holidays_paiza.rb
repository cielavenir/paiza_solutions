#!/usr/bin/ruby
require 'set'
M=Set.new(gets.to_i.times.map{gets.split.map &:to_i})
d=Time.new(2019,1,1)
r=c=0
while d.year==2019
	if d.wday==0||d.wday==6||M.include?([d.month,d.day])
		c+=1
		r=[r,c].max
	else
		c=0
	end
	d+=24*60*60
end
p r
