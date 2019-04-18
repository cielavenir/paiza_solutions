#!/usr/bin/ruby
#coding:utf-8
#it looks like year 0 is shit :)
x,y,z=gets.split
x=x.to_i+399
y=y.to_i
w=360*(x-398)+x/4-x/100+x/400+z.to_i+30*(y-1)-0
puts '日月火水木金土'[(w+2)%7]+'曜日'
