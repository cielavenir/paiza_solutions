//usr/bin/env xcrun swift $0 $@;exit

func array_binarysearch(needle:Int,_ haystack:[Int],_ size:Int)->Int{
	var high = size-1
	var low = 0
	var ret = size
	for ;low <= high; {
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
var _v=[Int](count:1000001,repeatedValue:0)
var v=[Int](count:n,repeatedValue:0)
var i=0,j=0,k=0
for i=0;i<n;++i { _v[Int(readLine()!)!]++ }
i=0
for j=0;j<1000001;j++ {
	for k=0;k<_v[j];k++ { v[i]=j;i++ }
}
for i=0;i<d;i++ {
	var m=Int(readLine()!)!
	var idx=array_binarysearch(m-v[0],v,n)
	var r=0
	var j=0
	var k=idx-1
	for ;r<m&&j<k&&v[j]+v[j+1]<=m; {
		for ;v[j]+v[k]>m; {k--}
		if r<v[j]+v[k] {r=v[j]+v[k]}
		j++
	}
	print(r)
}