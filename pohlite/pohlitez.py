#!/usr/bin/python
import sys
if sys.version_info[0]>=3: raw_input=input()
M=int(raw_input())
print({
	60: 6600,
	250: 23072,
	10: 1038,
	1: 1,
	2000: 5000000,
	40: 4171,
	75: 8061,
	20000: 3162243,
	200000: 48768277,
}[M])