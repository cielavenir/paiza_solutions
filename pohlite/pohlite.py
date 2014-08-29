#!/usr/bin/python
import sys
if sys.version_info[0]>=3: raw_input=input

M=int(raw_input())
N=int(raw_input())
num=[0]*N
cost=[0]*N
total=0
for j in range(N):
	q,r=[int(e) for e in raw_input().split()]
	total+=q
	num[j]=q
	cost[j]=r
bag=[0]+[-1]*total
for j in range(N):
	for i in reversed(range(num[j],total+1)):
		if bag[i-num[j]]>=0:
			if bag[i]<0 or bag[i]>bag[i-num[j]]+cost[j]:
				bag[i]=bag[i-num[j]]+cost[j]
j=-1
for i in range(M,total+1):
	if j<0 or (bag[i]>=0 and j>bag[i]):
		j=bag[i]
print(j)