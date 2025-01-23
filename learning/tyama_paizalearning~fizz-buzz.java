import java.util.*;
class Main{
	public static void main(String[]z){
		Scanner cin=new Scanner(System.in);
		int n=cin.nextInt();
		for(int i=1;i<=n;i++){
			System.out.println(i%15==0?"Fizz Buzz":i%3==0?"Fizz":i%5==0?"Buzz":i);
		}
	}
}
