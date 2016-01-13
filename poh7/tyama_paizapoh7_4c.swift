//usr/bin/env xcrun swift $0 $@;exit
let N=Int(readLine()!)!
var z=0
var n=N
for ;n>0;n/=5 {z+=n/5}
var r:Int64=1
var c2=0
var c5=0
var j=1
for ;j<=N;j++ {
	var i=j
	for ;c2<z && i%2==0;i/=2 {c2++}
	for ;c5<z && i%5==0;i/=5 {c5++}
	r*=Int64(i)
	r%=1000000000
}
print(r)