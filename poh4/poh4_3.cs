using System;
using System.Linq;
class PaizaPOH4{
	const int SIZE=9999999;
	static byte[] z=new byte[SIZE];
	static int input_count=0;

	static int get(){
		int r=0;
		for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
		input_count++;
		return r;
	}
	static void Main(){
		Console.OpenStandardInput().Read(z,0,SIZE);
		int T,N,i,cur=0;
		T=get();N=get();
		int[] a=new int[N];
		for(i=0;i<T;i++){a[i]=get();cur+=a[i];}
		int r=cur;
		for(;i<N;i++){
			a[i]=get();
			cur+=a[i];
			cur-=a[i-T];
			if(r<cur)r=cur;
		}
		Console.WriteLine(r);
	}
}