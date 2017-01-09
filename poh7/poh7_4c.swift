//usr/bin/env swift $0 $@;exit
let N=Int(readLine()!)!
var z=0
var n=N
while n>0 {z+=n/5;n/=5}
var r:Int64=1
var c2=0
var c5=0
for var j in 1...N {
	var i=j
	while c2<z && i%2==0 {c2+=1;i/=2}
	while c5<z && i%5==0 {c5+=1;i/=5}
	r*=Int64(i)
	r%=1000000000
}
print(r)
