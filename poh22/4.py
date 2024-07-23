#!/usr/bin/python3
import re
B=[17043521,1118480]+sum(([31<<i*5,1082401<<i]for i in range(5)),[])
A=open(0).read().replace("\n","")
print(next((x for x in'OX'if any(int(re.sub('.',lambda z:'%d'%(z[0]==x),A),2)&b==b for b in B)),'D'))
