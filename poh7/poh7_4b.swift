//usr/bin/env swift $0 $@;exit

//import CoreFoundation
#if _runtime(_ObjC)
import Darwin
#else
import Glibc
#endif

func getInt()->Int{
	var n:Int=0
	_=withUnsafeMutablePointer(to:&n){withVaList([OpaquePointer($0)]){vscanf("%d",$0)}}
	return n
}

var x=getInt()
var y=getInt()
var z=getInt()
var n=getInt()
var t=[[0,x],[0,y]]
for i in 0..<n {
	var a=getInt()
	var b=getInt()
	t[a].append(b)
}
var r=z
for i in 0...1 {
	t[i].sort{$0<$1}
	var a=i==0 ? x : y
	for j in 0...t[i].count-2 {
		var a=min(a,t[i][j+1]-t[i][j])
	}
	r*=a
}
print(r)
