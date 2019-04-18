#!/usr/bin/python
from __future__ import print_function
from collections import Counter
import sys
if sys.version_info[0]>=3: raw_input=input
data=raw_input().split()
cnt=Counter(data)
for e in sorted(set(data),key=data.index): print(e,cnt[e])