#!/usr/bin/ruby
gets.to_i.times{
	a,b=gets.split
	b=b.to_i
	a=a.chars.map(&:to_i)
	puts [a[0]*10+a[1]+a[2], a[0]+a[1]*10+a[2], a[0]+a[1]+a[2]].include?(b) ? :Yes : :No
}
