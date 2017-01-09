//usr/bin/env swift $0 $@;exit

func array_binarysearch(needle:Int,haystack:[Int],size:Int)->Int{
	var high = size-1
	var low = 0
	var ret = size
	while low <= high {
		let probe = (high + low) / 2
		let comparison = haystack[probe]-needle
		if comparison <= 0 {
			low = probe+1
		}else{
			ret=high
			high = probe-1
		}
	}
	return ret
}

var _a=readLine()!.characters.split{$0==" "}
let n=Int(String(_a[0]))!,d=Int(String(_a[1]))!
var _v=[Int](repeating:0,count:1000001)
var v=[Int](repeating:0,count:n)
var i=0,j=0,k=0
for i in 0..<n { _v[Int(readLine()!)!]+=1 }
i=0
for j in 0..<1000001 {
	for k in 0..<_v[j] { v[i]=j;i+=1 }
}
for i in 0..<d {
	var m=Int(readLine()!)!
	var idx=array_binarysearch(needle:m-v[0],haystack:v,size:n)
	var r=0
	var j=0
	var k=idx-1
	while r<m&&j<k&&v[j]+v[j+1]<=m {
		while v[j]+v[k]>m {k-=1}
		if r<v[j]+v[k] {r=v[j]+v[k]}
		j+=1
	}
	print(r)
}
