#!/usr/bin/ruby
#coding:utf-8
def zeller(_y,m,d)
	m+=1
	if m<4 then _y-=1;m+=12 end
	y=_y/100;z=_y%100
	(5*y+z+y/4+z/4+13*m/5+d-1)%7
end
puts '日月火水木金土'[zeller(*gets.split.map(&:to_i))]+'曜日'
