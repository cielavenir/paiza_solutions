//usr/bin/env swift $0 $@;exit

//import CoreFoundation
#if _runtime(_ObjC)
import Darwin
#else
import Glibc
#endif

let t=Int(readLine()!)!
var i=0
for i in 0..<t {
	var n=(1500-Int(readLine()!)!/3)%1440
	withVaList([n/60,n%60]){vprintf("%02d:%02d\n",$0)}
}