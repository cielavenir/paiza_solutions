//usr/bin/env go run $0 $@;exit
package main
import(
	"fmt"
	"os"
	"text/scanner"
	"strconv"
)

var sin scanner.Scanner
func scanint() int{
	sin.Scan()
	ret,_ := strconv.Atoi(sin.TokenText())
	return ret
}

func main(){
	sin.Init(os.Stdin)
	T:=scanint()
	N:=scanint()
	a:=make([]int,N)
	cur:=0

	for i:=0;i<T;i++ {
		a[i]=scanint()
		cur+=a[i]
	}
	r:=cur
	for i:=T;i<N;i++ {
		a[i]=scanint()
		cur+=a[i]
		cur-=a[i-T]
		if r<cur {r=cur}
	}
	fmt.Println(r)
}