#!/usr/bin/python
#somehow WA I dunno why.
from scipy.sparse import*
e,v,t=map(int,raw_input().split())
a,b,c=zip(*[map(int,raw_input().split()) for _ in range(e)])
z=csgraph.dijkstra(csr_matrix((c,(a,b)),[v]*2),0,t)
print int(z[0])
