#!/usr/bin/ruby
N=gets.to_i
z=0
n=N
while n>0
	z+=n/5
	n/=5
end
r=1
c2=0
c5=0
(1..N).each{|_|
	i=_
	while c2<z && i%2==0
		c2+=1
		i/=2
	end
	while c5<z && i%5==0
		c5+=1
		i/=5
	end
	r*=i
	r%=10**9
}
p r