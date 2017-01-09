//usr/bin/env swift $0 $@;exit
let n=Int(readLine()!)!
let m=Int(readLine()!)!
var i=0,j=0,c=0,a=["R","W"]
for i in 0..<m {
	print(a[c],terminator:"")
	j+=1
	if j==n {j=0;c^=1}
}
