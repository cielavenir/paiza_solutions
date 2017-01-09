//usr/bin/env swift $0 $@;exit
var n=0
for var i in 0..<5 {if readLine()!=="yes" {n+=1} else {n-=1}}
print(n>0 ? "yes" : "no")
