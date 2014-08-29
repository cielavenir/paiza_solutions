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
	h=arg[0]
	w=arg[1]
	a=Array(h)
	for i in [0...h]
		line=T[1+i]
		a[i]=Array(w)
		for j in [0...w]
			a[i][j]=Array(h)
			a[i][j][0]=line[j]^1
	accum=Array(h)
	for i in [0...h]
		accum[i]=Array(w+1)
		for j in [0..w]
			accum[i][j]=0;
	for i in [0...h]
		accum[0][a[i][0][0]]++
		for j in [1...w]
			if a[i][j][0]
				a[i][j][0]+=a[i][j-1][0]
				accum[0][a[i][j][0]]++
	for i in [1...h]
		for j in [0...w]
			for k in [1..i]
				a[i][j][k]=a[i-1][j][k-1]
				if a[i][j][k]>a[i][j][k-1]
					a[i][j][k]=a[i][j][k-1]
				if !a[i][j][k]
					break
				accum[k][a[i][j][k]]++
	for i in [0...h]
		for j in [0...w]
			accum[i][w-1-j]+=accum[i][w-1-j+1]
	k=Number(T[1+h])
	for i in [0...k]
		arg=T[1+h+1+i].split(' ').map(Number)
		s=arg[0]
		t=arg[1]
		console.log(if s<=h&&t<=w then accum[s-1][t] else 0)