#!/usr/bin/python
import sys
if sys.version_info[0]>=3:
	raw_input=input
	xrange=range

h,w=[int(e) for e in raw_input().split()]
a=[[[0 if c=='1' else 1]+[0]*(h-1) for c in raw_input().rstrip()] for i in xrange(h)]
accum=[[0]*(w+1) for i in xrange(h)]
for i in xrange(h):
	accum[0][a[i][0][0]]+=1
	for j in xrange(1,w):
		if a[i][j][0]>0:
			a[i][j][0]+=a[i][j-1][0]
			accum[0][a[i][j][0]]+=1
for i in xrange(1,h):
	for j in xrange(w):
		for k in xrange(1,i+1):
			a[i][j][k]=min(a[i-1][j][k-1],a[i][j][k-1])
			if a[i][j][k]==0: break
			accum[k][a[i][j][k]]+=1
for i in xrange(h):
	for j in reversed(xrange(0,w)):
		accum[i][j]+=accum[i][j+1]
for i in xrange(int(raw_input())):
	s,t=[int(e) for e in raw_input().split()]
	print(accum[s-1][t] if s<=h and t<=w else 0)