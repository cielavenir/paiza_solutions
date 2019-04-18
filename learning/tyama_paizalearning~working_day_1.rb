#!/usr/bin/ruby
T={'SUN'=>1,'MON'=>1,'TUE'=>1,'WED'=>1,'THU'=>1,'FRI'=>3,'SAT'=>2}
a,b,c=gets.split
d=Time.new(2019,a.to_i,b.to_i)+T[c]*24*60*60
puts '%d月%d日'%[d.month,d.day]
