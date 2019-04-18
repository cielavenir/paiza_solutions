#!/usr/bin/ruby
n,k,*a=`dd`.split.map &:to_i
a.sort!
tail=a.size-1
head=r=0
while head<tail
	head+=1 while head<tail&&a[head]+a[tail]<k
	r+=1 if head<tail
	head+=1
	tail-=1
end
p r
