//usr/bin/env swift $0 $@;exit
var c=0
var a=0
var t=0
readLine()!.characters.forEach{
	if String($0)=="c" {c+=1}
	if String($0)=="a" {a+=1}
	if String($0)=="t" {t+=1}
}
var ma=[c,a,t].max()!
var mi=[c,a,t].min()!
print(mi)
print(ma-c)
print(ma-a)
print(ma-t)
