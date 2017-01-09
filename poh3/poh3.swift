//usr/bin/env swift $0 $@;exit

//let M=getInt(),N=getInt()
let M=Int(readLine()!)!,N=Int(readLine()!)!
var num=[Int](repeating:0,count:N)
var cost=[Int](repeating:0,count:N)
var total=0
var i=0,j=0

for j in 0..<N {
	let a=readLine()!.characters.split{$0==" "}
	//let q=getInt()
	//let r=getInt()
	let q=Int(String(a[0]))!
	let r=Int(String(a[1]))!
	total+=q
	num[j]=q
	cost[j]=r
}
var bag=[Int](repeating:0,count:total+1)
for i in 1...total {bag[i] = -1}
var t=0
for j in 0..<N {
	t+=num[j]
	for i in stride(from:t,through:num[j],by:-1) {
		if bag[i-num[j]]>=0 {
			let x=bag[i-num[j]]+cost[j]
			if bag[i]<0||bag[i]>x {
				bag[i]=x
			}
		}
	}
}
j = -1
for i in M...total { if j<0||(bag[i]>=0&&j>bag[i]) {j=bag[i]}}
print(j)
