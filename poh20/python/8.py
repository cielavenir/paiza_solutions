#!/usr/bin/python3
B=[448,56,7,292,146,73,273,84]
A=int(open(0).read().replace("\n","").replace('.','0').replace('#','1'),2)
print(sum(A&b==b for b in B))
