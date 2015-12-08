//usr/bin/env xcrun swift $0 $@;exit

//let M=getInt(),N=getInt()
let M=Int(readLine()!)!,N=Int(readLine()!)!
var num=[Int](count:N,repeatedValue:0)
var cost=[Int](count:N,repeatedValue:0)
var total=0
var i=0,j=0

for j=0;j<N;++j {
	let a=readLine()!.characters.split{$0==" "}
	//let q=getInt()
	//let r=getInt()
	let q=Int(String(a[0]))!
	let r=Int(String(a[1]))!
	total+=q
	num[j]=q
	cost[j]=r
}
var bag=[Int](count:total+1,repeatedValue:0)
for i=1;i<=total;++i {bag[i] = -1}
var t=0
for j=0;j<N;++j {
	t+=num[j]
	for i=t;i>=num[j];--i {
		if bag[i-num[j]]>=0 {
			let x=bag[i-num[j]]+cost[j]
			if bag[i]<0||bag[i]>x {
				bag[i]=x
			}
		}
	}
}
j = -1
for i=M;i<=total;++i { if j<0||(bag[i]>=0&&j>bag[i]) {j=bag[i]}}
print(j)