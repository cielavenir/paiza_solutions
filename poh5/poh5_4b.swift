//usr/bin/env swift $0 $@;exit
var _a=readLine()!.characters.split{$0==" "}
let W=Int(String(_a[0]))!,H=Int(String(_a[1]))!,Q=Int(String(_a[2]))!
var m=[[Int]](repeating:[Int](repeating:0,count:W),count:H)
var imos=[[Int]](repeating:[Int](repeating:0,count:W+1),count:H+1)
var h=0,w=0,i=0
for h in 0..<H {
	_a=readLine()!.characters.split{$0==" "}
	for w in 0..<W {m[h][w]=Int(String(_a[w]))!}
}
var s=0
for i in 0..<Q {
	_a=readLine()!.characters.split{$0==" "}
	var w1=Int(String(_a[0]))!-1
	var h1=Int(String(_a[1]))!-1
	var w2=Int(String(_a[2]))!
	var h2=Int(String(_a[3]))!
	imos[h1][w1]+=1
	imos[h1][w2]-=1
	imos[h2][w1]-=1
	imos[h2][w2]+=1
}
for h in 0..<H {
	for w in 1..<W {imos[h][w]+=imos[h][w-1]}
}
for h in 1..<H {
	for w in 0..<W {imos[h][w]+=imos[h-1][w]}
}
for h in 0..<H {
	for w in 0..<W {
		if imos[h][w]>0 {s+=m[h][w]}
	}
}
print(s)
