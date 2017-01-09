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
var	a=getInt(),b=getInt(),c=getInt(),d=getInt()

print(a*d>b*c ? 1 : 2)
