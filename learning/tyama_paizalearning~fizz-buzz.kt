fun main(args: Array<String>) {
	val n=readLine()!!.toInt()
	for(i in 1..n){
		println(if(i%15==0)"Fizz Buzz" else if(i%3==0)"Fizz" else if(i%5==0)"Buzz" else i)
	}
}
