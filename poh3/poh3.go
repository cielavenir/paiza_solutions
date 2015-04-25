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
	M:=scanint()
	N:=scanint()
	num:=make([]int,N)
	cost:=make([]int,N)
	total:=0

	for j:=0;j<N;j++ {
		q:=scanint()
		r:=scanint()
		total+=q
		num[j]=q
		cost[j]=r
	}
	bag:=make([]int,total+1)
	for i:=1;i<=total;i++ {bag[i]=-1}
	for j:=0;j<N;j++ {
		for i:=total;i>=num[j];i-- {
			if bag[i-num[j]]>=0 {
				if bag[i]<0||bag[i]>bag[i-num[j]]+cost[j] {
					bag[i]=bag[i-num[j]]+cost[j]
				}
			}
		}
	}
	j:=-1
	for i:=M;i<=total;i++ { if j<0||(bag[i]>=0&&j>bag[i]) {j=bag[i]}}
	fmt.Println(j)
}