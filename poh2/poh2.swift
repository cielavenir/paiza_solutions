//usr/bin/env swift $0 $@;exit

var _a=readLine()!.characters.split{$0==" "}
let h=Int(String(_a[0]))!,w=Int(String(_a[1]))!
var a=[[[Int]]](repeating:[[Int]](repeating:[Int](repeating:0,count:h),count:w),count:h)
var accum=[[Int]](repeating:[Int](repeating:0,count:w+1),count:h)
var i=0,j=0,k=0
for i in 0..<h {
	let line=readLine()!
	j=0
	line.utf8.forEach{
		a[i][j][0]=(Int($0) - 48)^1
		j+=1
	}
}
for i in 0..<h {
	accum[0][a[i][0][0]]+=1
	for j in 1..<w {
		if a[i][j][0]>0 {
			a[i][j][0]+=a[i][j-1][0]
			accum[0][a[i][j][0]]+=1
		}
	}
}
for i in 1..<h {
	for j in 0..<w {
		for k in 1...i {
			a[i][j][k]=a[i-1][j][k-1]
			if a[i-1][j][k-1]>a[i][j][k-1] { a[i][j][k]=a[i][j][k-1] }
			if a[i][j][k]==0 {break}
			accum[k][a[i][j][k]]+=1
		}
	}
}
for i in 0..<h {
	for j in stride(from:w-1,through:0,by:-1) {
		accum[i][j]+=accum[i][j+1]
	}
}
for k in 0..<Int(readLine()!)! {
	_a=readLine()!.characters.split{$0==" "}
	let s=Int(String(_a[0]))!,t=Int(String(_a[1]))!
	if s<=h&&t<=w {
		print(accum[s-1][t])
	} else {
		print(0)
	}
}
