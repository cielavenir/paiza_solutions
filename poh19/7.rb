#!/usr/bin/ruby
_,m,a,*x = `dd`.split.map &:to_i
s=0
x.each{|e|
	if e>a
		m+=s*e
		s=0
	else
		t,m=m.divmod e
		s+=t
	end
}
p s*x[-1]+m
