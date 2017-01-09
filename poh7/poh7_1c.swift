//usr/bin/env swift $0 $@;exit
var T="cat"
var r=0
var c=0
readLine()!.characters.forEach{
	if $0==T[T.index(T.startIndex,offsetBy:c)] {
		c+=1
		if c==T.characters.count {
			r+=1
			c=0
		}
	} else {
		c=0
		if $0==T[T.index(T.startIndex,offsetBy:c)] {c=1}
	}
}
print(r)
