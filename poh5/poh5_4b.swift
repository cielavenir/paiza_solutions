//usr/bin/env xcrun swift $0 $@;exit
var _a=readLine()!.characters.split{$0==" "}
let W=Int(String(_a[0]))!,H=Int(String(_a[1]))!,Q=Int(String(_a[2]))!
var m=[[Int]](count:H,repeatedValue:[Int](count:W,repeatedValue:0))
var imos=[[Int]](count:H+1,repeatedValue:[Int](count:W+1,repeatedValue:0))
var h=0,w=0,i=0
for h=0;h<H;h++ {
	_a=readLine()!.characters.split{$0==" "}
	for w=0;w<W;w++ {m[h][w]=Int(String(_a[w]))!}
}
var s=0
for i=0;i<Q;i++ {
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
for h=0;h<H;h++ {
	for w=1;w<W;w++ {imos[h][w]+=imos[h][w-1]}
}
for h=1;h<H;h++ {
	for w=0;w<W;w++ {imos[h][w]+=imos[h-1][w]}
}
for h=0;h<H;h++ {
	for w=0;w<W;w++ {
		if imos[h][w]>0 {s+=m[h][w]}
	}
}
print(s)