//usr/bin/env swift $0 $@;exit
var lst:[Int: Int]=[:]
var f=false
var r:[Int]=[]

readLine()
readLine()
readLine()!.characters.split{$0==" "}.forEach{lst[Int(String($0))!]=1}
readLine()
readLine()!.characters.split{$0==" "}.forEach{
	let n=Int(String($0))!
	if lst[n]==nil {r.append(n)}
}
r.sort()
for var i in 0..<r.count {
	if f {print(" ",terminator:"")}
	f=true
	print(r[i],terminator:"")
}
print(f ? "" : "None")
