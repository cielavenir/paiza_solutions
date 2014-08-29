#!/usr/bin/python
import sys,io,bisect
def init():
	reader = io.open(sys.stdin.fileno(),'rb',0)
	if sys.version_info[0]<3:
		s=reader.readall()
	if sys.version_info[0]>=3:
		s=str(reader.readall(),encoding='utf8')
		raw_input=input
		xrange=range
	reader.close()
	x=s.rstrip().split("\n")
	return (int(x[0].split()[0],10),[int(e,10) for e in x[1:]])

n,S=init()
v=sorted(S[0:n])
for m in S[n:]:
	r=j=0
	#k=n-1
	k=bisect.bisect_right(v,m-v[0])-1
	while r<m and j<k and v[j]+v[j+1]<=m:
		while v[j]+v[k]>m: k-=1
		if r<v[j]+v[k]: r=v[j]+v[k]
		j+=1
	print(r)