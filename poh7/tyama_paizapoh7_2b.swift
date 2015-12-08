//usr/bin/env xcrun swift $0 $@;exit
var n=0,i=0
for ;i<5;++i{if readLine()!=="yes" {n++} else {n--}}
print(n>0 ? "yes" : "no")