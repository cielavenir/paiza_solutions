#!/usr/bin/ruby
a=[]
x,y,z=gets.split.map(&:to_i)
z.times{
	_=['.']*y
	x.times{
		s=gets.chomp
		y.times{|i|_[i]='#'if s[i,1]=='#'}
	}
	gets
	a<<_*''
}
puts a.reverse