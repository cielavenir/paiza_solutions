#!/usr/bin/env coffee
T=[]
stdin = process.openStdin()
stdin.setEncoding('utf8')

array_binarysearch = (needle,haystack,size) ->
	high = size-1
	low = 0
	ret = size
	while low <= high
		probe = (high + low) / 2^0
		comparison = haystack[probe]-needle
		if comparison <= 0
			low = probe+1
		else
			ret=high;
			high = probe-1;
	return ret

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
	n=arg[0]
	d=arg[1]
	v=T.slice(1,1+n).map(Number).sort (a,b) ->
		return a-b
	for i in [0...d]
		m=Number(T[1+n+i])
		idx=array_binarysearch(m-v[0],v,n)
		r=0;
		j=0;
		k=idx-1
		while r<m&&j<k&&v[j]+v[j+1]<=m
			while v[j]+v[k]>m
				k--
			if r<v[j]+v[k]
				r=v[j]+v[k]
			j++
		console.log r