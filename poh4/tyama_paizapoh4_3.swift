//usr/bin/env xcrun swift $0 $@;exit

let _a=readLine()!.characters.split{$0==" "}
let T=Int(String(_a[0]))!,N=Int(String(_a[1]))!
var a=[Int](count:N,repeatedValue:0)
var cur=0,i=0

for i=0;i<T;i++ {
	a[i]=Int(readLine()!)!
	cur+=a[i]
}
var r=cur
for i=T;i<N;i++ {
	a[i]=Int(readLine()!)!
	cur+=a[i]
	cur-=a[i-T]
	if r<cur {r=cur}
}
print(r)