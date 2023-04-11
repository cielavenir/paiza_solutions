#!/usr/bin/ruby
n,a,b = `dd`.split.map &:to_i
1.upto(n){|i|
	if i%a.lcm(b) == 0
		puts 'paizaprogramming'
	elsif i%a == 0
		puts 'paiza'
	elsif i%b == 0
		puts 'programming'
	else
		p i
	end
}
