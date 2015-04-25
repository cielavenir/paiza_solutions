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
	//wtf?
	var m [100][100]int
	var imos [100][100]int

	sin.Init(os.Stdin)
	W:=scanint()
	H:=scanint()
	Q:=scanint()

	for h:=0;h<H;h++ {
		for w:=0;w<W;w++ {m[h][w]=scanint()}
	}
	s:=0
	for i:=0;i<Q;i++ {
		w1:=scanint()-1
		h1:=scanint()-1
		w2:=scanint()
		h2:=scanint()
		imos[h1][w1]+=1
		imos[h1][w2]-=1
		imos[h2][w1]-=1
		imos[h2][w2]+=1
	}
	for h:=0;h<H;h++ {
		for w:=1;w<W;w++ {imos[h][w]+=imos[h][w-1]}
	}
	for h:=1;h<H;h++ {
		for w:=0;w<W;w++ {imos[h][w]+=imos[h-1][w]}
	}
	for h:=0;h<H;h++ {
		for w:=0;w<W;w++ {
			if imos[h][w]>0 {s+=m[h][w]}
		}
	}
	fmt.Println(s)
}