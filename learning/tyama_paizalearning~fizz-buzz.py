#!/usr/bin/python
import sys
for i in range(1,1+int(sys.stdin.readline())):
	print('Fizz Buzz' if i%15==0 else 'Fizz' if i%3==0 else 'Buzz' if i%5==0 else i)
