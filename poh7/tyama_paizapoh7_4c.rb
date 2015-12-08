#!/usr/bin/ruby
r=1
(1..gets.to_i).each{|i|
	r*=i
	r/=10 while r%10==0
	r%=10**11
}
p r%10**9