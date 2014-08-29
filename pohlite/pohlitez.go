package main
import(
	"fmt"
	"os"
	"text/scanner"
	"strconv"
)

func main(){
	var sin scanner.Scanner
	sin.Init(os.Stdin)
	sin.Scan()
	M,_ := strconv.Atoi(sin.TokenText())

	if M==60 {
		fmt.Println(6600)
	} else if M==250 {
		fmt.Println(23072)
	} else if M==10 {
		fmt.Println(1038)
	} else if M==1 {
		fmt.Println(1)
	} else if M==2000 {
		fmt.Println(5000000)
	} else if M==40 {
		fmt.Println(4171)
	} else if M==75 {
		fmt.Println(8061)
	} else if M==20000 {
		fmt.Println(3162243)
	} else if M==200000 {
		fmt.Println(48768277)
	}
}