#!/usr/bin/ruby
n,k=gets.split.map(&:to_i)
a=[0]+gets.split.map(&:to_i)
i=0
s=0
r1=r2=0
lst=[]
while i<k
	s+=a[i]
	i+=1
end
while i<=n
	s+=a[i]
	if s>r1
		r1=s
		lst=[]
	end
	if s==r1
		lst<<i-k+1
	end
	s-=a[i-k+1]
	i+=1
end
puts "#{lst.size} #{lst.first}"