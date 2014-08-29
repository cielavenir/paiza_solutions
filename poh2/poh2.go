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
	var a [300][300][300]int
	var accum [300][301]int

	sin.Init(os.Stdin)
	h:=scanint()
	w:=scanint()

	for i:=0;i<h;i++ {
		sin.Scan()
		line:=sin.TokenText()
		for j:=0;j<w;j++ {a[i][j][0]=(int)(line[j]-'0')^1}
	}
	for i:=0;i<h;i++ {
		accum[0][a[i][0][0]]++
		for j:=1;j<w;j++ {
			if a[i][j][0]>0 {
				a[i][j][0]+=a[i][j-1][0]
				accum[0][a[i][j][0]]++
			}
		}
	}
	for i:=1;i<h;i++ {
		for j:=0;j<w;j++ {
			for k:=1;k<=i;k++ {
				a[i][j][k]=a[i-1][j][k-1]
				if a[i-1][j][k-1]>a[i][j][k-1] { a[i][j][k]=a[i][j][k-1] }
				if a[i][j][k]==0 {break}
				accum[k][a[i][j][k]]++
			}
		}
	}
	for i:=0;i<h;i++ {
		for j:=w-1;j>=0;j-- {
			accum[i][j]+=accum[i][j+1]
		}
	}
	for k:=scanint();k>0;k-- {
		s:=scanint()
		t:=scanint()
		if s<=h&&t<=w {
			fmt.Println(accum[s-1][t])
		} else {
			fmt.Println(0)
		}
	}
}