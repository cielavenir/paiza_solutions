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
	M=Number(T[0])
	N=Number(T[1])
	num=Array(N)
	cost=Array(N)
	total=0
	for j in [0...N]
		arg=T[j+2].split(' ').map(Number)
		total+=arg[0]
		num[j]=arg[0]
		cost[j]=arg[1]
	bag=Array(total+1)
	bag[0]=0
	for i in [1..total]
		bag[i]=-1
	for j in [0...N]
		i=total
		while i>=num[j]
			if bag[i-num[j]]>=0
				if bag[i]<0 || bag[i]>bag[i-num[j]]+cost[j]
					bag[i]=bag[i-num[j]]+cost[j]
			i--
	j=-1
	for i in [M..total]
		if j<0 || (bag[i]>=0 && j>bag[i])
			j=bag[i]
	console.log(j)