#!/usr/bin/python
import sys
if sys.version_info[0]>=3: raw_input=input

W,H,Q=[int(e) for e in raw_input().split()]
m=[[int(e) for e in raw_input().split()] for i in range(H)]
imos=[[0]*(W+1) for i in range(H+1)]
for i in range(Q):
	w1,h1,w2,h2=[int(e) for e in raw_input().split()]
	imos[h1-1][w1-1]+=1
	imos[h1-1][w2]-=1
	imos[h2][w1-1]-=1
	imos[h2][w2]+=1
s=0
for h in range(0,H):
	for w in range(1,W):
		imos[h][w]+=imos[h][w-1]
for h in range(1,H):
	for w in range(0,W):
		imos[h][w]+=imos[h-1][w]
for h in range(0,H):
	for w in range(0,W):
		if imos[h][w]: s+=m[h][w]
print(s)