#!/usr/bin/ruby
n,l,*a=`dd`.split.map &:to_i
#a.count(0)<=l&&(p n;exit)
a<<0
head=tail=k=r=0
while head<=n
while k<=l && head<=n
k+=1 if a[head]==0
head+=1
end
r=[r,head-tail-1].max
while k>l && tail<head
k-=1 if a[tail]==0
tail+=1
end
end
p r
