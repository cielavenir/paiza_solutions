using System;
using System.Linq;
class PaizaPOH2{
	const int SIZE=9999999;
	static byte[] z=new byte[SIZE];
	static int input_count=0;

	static int get(){
		int r=0;
		for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
		input_count++;
		return r;
	}
	static int getC(){
		return z[input_count++];
	}
	static void Main(){
		Console.OpenStandardInput().Read(z,0,SIZE);
		int h,w,s,t,i,j,k;
		//int[] arg=Console.ReadLine().Split(' ').Select(_=>int.Parse(_)).ToArray();
		//h=arg[0];
		//w=arg[1];
		h=get();
		w=get();
		int[,,] a=new int[h,w,h];
		int[,] accum=new int[h,w+1];
		for(i=0;i<h;i++){
			//string line=Console.ReadLine();
			for(j=0;j<w;j++)a[i,j,0]=(getC()-'0')^1;
			getC();
		}
		for(i=0;i<h;i++){
			accum[0,a[i,0,0]]++;
			for(j=1;j<w;j++){
				if(a[i,j,0]>0){
					a[i,j,0]+=a[i,j-1,0];
					accum[0,a[i,j,0]]++;
				}
			}
		}
		for(i=1;i<h;i++)for(j=0;j<w;j++)for(k=1;k<=i;k++){
			a[i,j,k]=Math.Min(a[i-1,j,k-1],a[i,j,k-1]);
			if(a[i,j,k]==0)break;
			accum[k,a[i,j,k]]++;
		}
		for(i=0;i<h;i++)for(j=w-1;j>=0;j--)accum[i,j]+=accum[i,j+1];
		//k=int.Parse(Console.ReadLine());
		k=get();
		for(;k>0;k--){
			//arg=Console.ReadLine().Split(' ').Select(_=>int.Parse(_)).ToArray();
			//s=arg[0];
			//t=arg[1];
			s=get();
			t=get();
			Console.WriteLine(s<=h&&t<=w?accum[s-1,t]:0);
		}
	}
}