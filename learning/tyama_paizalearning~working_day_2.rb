#!/usr/bin/ruby
require 'set'
T={'SUN'=>1,'MON'=>1,'TUE'=>1,'WED'=>1,'THU'=>1,'FRI'=>3,'SAT'=>2}
M=Set.new(DATA.map{|e|e.split.map &:to_i})
a,b,c=gets.split
d=Time.new(2019,a.to_i,b.to_i)+T[c]*24*60*60
d+=24*60*60 while M.include?([d.month,d.day])
puts '%d月%d日'%[d.month,d.day]
__END__
1 1
1 14
2 11
3 21
4 29
4 30
5 1
5 2
5 3
5 4
5 5
5 6
7 15
8 11
8 12
9 16
9 23
10 14
10 22
11 3
11 4
11 23
