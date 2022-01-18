#!/usr/bin/ruby
def hypot(a,b)
	Math.hypot(a[0]-b[0],a[1]-b[1])
end
def f(a)
	x,y,z = a.each_slice(2).to_a
	a=hypot(x,y)
	b=hypot(y,z)
	c=hypot(z,x)
	s=(a+b+c)/2
	s*(s-a)*(s-b)*(s-c)
end
p (1..gets.to_i).each.max_by{
	gets.split.map(&:to_i).permutation.map(&method(:f)).max
}
