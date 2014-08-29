#!/usr/bin/python
import sys,bisect
if sys.version_info[0]>=3:
	raw_input=input
	xrange=range

n,d=[int(e,10) for e in raw_input().split()]
v=sorted([int(raw_input(),10) for i in xrange(n)])
for i in xrange(d):
	m=int(raw_input(),10)
	r=j=0
	#k=n-1
	k=bisect.bisect_right(v,m-v[0])-1
	while r<m and j<k and v[j]+v[j+1]<=m:
		while v[j]+v[k]>m: k-=1
		if r<v[j]+v[k]: r=v[j]+v[k]
		j+=1
	print(r)