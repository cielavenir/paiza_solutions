#!/usr/bin/ruby
#coding:utf-8
class Array
	def <=(o)
		(self<=>o) <= 0
	end
end
y,m,d=gets.split.map &:to_i
e,z = [y,m,d]<=[1912,7,29] ? ['明治',1868] :
      [y,m,d]<=[1926,12,24] ? ['大正',1912] :
      [y,m,d]<=[1989,1,7] ? ['昭和',1926] :
      [y,m,d]<=[2019,4,30] ? ['平成',1989] : ['令和',2019]
puts '%s%s年%d月%d日'%[e,y-z+1==1 ? '元' : y-z+1,m,d]
