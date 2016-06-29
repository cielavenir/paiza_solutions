//usr/bin/env xcrun swift $0 $@;exit

var _a=readLine()!.characters.split{$0==" "}
let h=Int(String(_a[0]))!,w=Int(String(_a[1]))!
var a=[[[Int]]](count:h,repeatedValue:[[Int]](count:w,repeatedValue:[Int](count:h,repeatedValue:0)))
var accum=[[Int]](count:h,repeatedValue:[Int](count:w+1,repeatedValue:0))
var i=0,j=0,k=0
for i=0;i<h;i++ {
	let line=readLine()!
	j=0
	line.utf8.forEach{
		a[i][j][0]=(Int($0) - 48)^1
		j++
	}
}
for i=0;i<h;i++ {
	accum[0][a[i][0][0]]++
	for j=1;j<w;j++ {
		if a[i][j][0]>0 {
			a[i][j][0]+=a[i][j-1][0]
			accum[0][a[i][j][0]]++
		}
	}
}
for i=1;i<h;i++ {
	for j=0;j<w;j++ {
		for k=1;k<=i;k++ {
			a[i][j][k]=a[i-1][j][k-1]
			if a[i-1][j][k-1]>a[i][j][k-1] { a[i][j][k]=a[i][j][k-1] }
			if a[i][j][k]==0 {break}
			accum[k][a[i][j][k]]++
		}
	}
}
for i=0;i<h;i++ {
	for j=w-1;j>=0;j-- {
		accum[i][j]+=accum[i][j+1]
	}
}
for k=Int(readLine()!)!;k>0;k-- {
	_a=readLine()!.characters.split{$0==" "}
	let s=Int(String(_a[0]))!,t=Int(String(_a[1]))!
	if s<=h&&t<=w {
		print(accum[s-1][t])
	} else {
		print(0)
	}
}