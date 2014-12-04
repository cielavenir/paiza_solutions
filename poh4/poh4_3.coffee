#!/usr/bin/env coffee
T=[]
stdin = process.openStdin()
stdin.setEncoding('utf8')

input_fragment=''
stdin.on 'data', (input) ->
		ref=(input_fragment+input).split("\n")
		input_fragment=ref.pop()
		for i in [0...ref.length]
			if ref[i]==''
				continue
			T.push(ref[i])


stdin.on 'end', (z) ->
	if input_fragment
		ref=(input_fragment+"\n").split("\n")
		input_fragment=ref.pop()
		for i in [0...ref.length]
			if ref[i]==''
				continue
			T.push(ref[i])
	arg=T[0].split(' ').map(Number)
	_T=arg[0]
	N=arg[1]
	a=[]
	i=0
	cur=0
	for i in [0..._T]
		a[i]=Number(T[i+1])
		cur+=a[i]
	r=cur
	for i in [_T...N]
		a[i]=Number(T[i+1])
		cur+=a[i]
		cur-=a[i-_T]
		if r<cur
			r=cur
	console.log(r)