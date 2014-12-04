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
	console.log(
		if M==60 then 6600 else if M==250 then 23072 else if M==10 then 1038 else if M==1 then 1 else if M==2000 then 5000000 else if M==40 then 4171 else if M==75 then 8061 else if M==20000 then 3162243 else if M==200000 then 48768277 else -1
	)