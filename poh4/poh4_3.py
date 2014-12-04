#!/usr/bin/python
import sys
if sys.version_info[0]>=3: raw_input=input

T,N=[int(e) for e in raw_input().split()]
a=[0]*N
cur=i=0
while i<T:
	a[i]=int(raw_input())
	cur+=a[i]
	i+=1
r=cur
while i<N:
	a[i]=int(raw_input())
	cur+=a[i]
	cur-=a[i-T]
	if r<cur: r=cur
	i+=1
print(r)