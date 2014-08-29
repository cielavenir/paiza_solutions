package main
import(
	"fmt"
	"os"
	"text/scanner"
	"strconv"
	"sort"
)

var sin scanner.Scanner
func scanint() int{
	sin.Scan()
	ret,_ := strconv.Atoi(sin.TokenText())
	return ret
}

/*
func array_binarysearch(needle int,haystack []int,size int) int{
	high := size-1
	low := 0
	ret := size
	for low <= high {
		probe := (high + low) / 2
		comparison := haystack[probe]-needle
		if comparison <= 0 {
			low = probe+1
		}else{
			ret=high
			high = probe-1
		}
	}
	return ret
}
*/

func main(){
	sin.Init(os.Stdin)
	n:=scanint()
	d:=scanint()
	_v:=make([]int,1000001)
	v:=make([]int,n)
	for i:=0;i<n;i++ { _v[scanint()]++ }
	i:=0
	for j:=0;j<1000001;j++ {
		for k:=0;k<_v[j];k++ { v[i]=j;i++ }
	}
	for i=0;i<d;i++ {
		m:=scanint()
		//idx:=array_binarysearch(m-v[0],v,n)
		idx:=sort.Search(n,func(i int) bool{return m-v[0]<v[i]})
		r:=0
		j:=0
		k:=idx-1
		for r<m&&j<k&&v[j]+v[j+1]<=m {
			for v[j]+v[k]>m {k--}
			if r<v[j]+v[k] {r=v[j]+v[k]}
			j++
		}
		fmt.Println(r)
	}
}