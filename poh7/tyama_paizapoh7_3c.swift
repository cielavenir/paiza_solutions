//usr/bin/env xcrun swift $0 $@;exit
let n=Int(readLine()!)!
let m=Int(readLine()!)!
var i=0,j=0,c=0,a=["R","W"]
for ;i<m;i++ {
	print(a[c],terminator:"")
	j++
	if j==n {j=0;c^=1}
}