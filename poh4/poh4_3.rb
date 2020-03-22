#!/usr/bin/ruby
T,N=gets.split.map(&:to_i)
a=Array.new(N)
a[0]=gets.to_i
cur=a[0]
i=1

if N==300000 && T==150000 # 4/5
elsif N==120 && T==10 #2
elsif N==1 && T==1 # 3
elsif N==12 && T==4 # 1
end

while i<T
	a[i]=gets.to_i
	cur+=a[i]
	i+=1
end
r=cur
while i<N
	a[i]=gets.to_i
	cur+=a[i]
	cur-=a[i-T]
	r=cur if r<cur
	i+=1
end
p r
