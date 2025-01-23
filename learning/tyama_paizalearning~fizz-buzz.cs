using System;
class FizzBuzz{
	static void Main(){
		int n=int.Parse(Console.ReadLine());
		for(int i=1;i<=n;i++){
			Console.WriteLine(i%15==0?"Fizz Buzz":i%3==0?"Fizz":i%5==0?"Buzz":i.ToString());
		}
	}
}
