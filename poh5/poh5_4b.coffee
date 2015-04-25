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
	W=arg[0]
	H=arg[1]
	Q=arg[2]
	m=Array(H)
	imos=Array(H+1)
	for i in [0...H]
		m[i]=T[1+i].split(' ').map(Number)
		imos[i]=Array(W+1)
		for j in [0...W+2]
			imos[i][j]=0
	imos[H]=Array(W+1)
	for j in [0...W+2]
		imos[i][j]=0
	s=0
	for i in [0...Q]
		arg=T[1+H+i].split(' ').map(Number)
		w1=arg[0]-1
		h1=arg[1]-1
		w2=arg[2]
		h2=arg[3]
		imos[h1][w1]+=1
		imos[h1][w2]-=1
		imos[h2][w1]-=1
		imos[h2][w2]+=1
	for h in [0...H]
		for w in [1...W]
			imos[h][w]+=imos[h][w-1]
	for h in [1...H]
		for w in [0...W]
			imos[h][w]+=imos[h-1][w]
	for h in [0...H]
		for w in [0...W]
			if imos[h][w]>0
				s+=m[h][w]
	console.log(s)