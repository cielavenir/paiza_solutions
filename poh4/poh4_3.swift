//usr/bin/env swift $0 $@;exit

let _a=readLine()!.characters.split{$0==" "}
let T=Int(String(_a[0]))!,N=Int(String(_a[1]))!
var a=[Int](repeating:0,count:N)
var cur=0,i=0

for i in 0..<T {
	a[i]=Int(readLine()!)!
	cur+=a[i]
}
var r=cur
for i in T..<N {
	a[i]=Int(readLine()!)!
	cur+=a[i]
	cur-=a[i-T]
	if r<cur {r=cur}
}
print(r)
