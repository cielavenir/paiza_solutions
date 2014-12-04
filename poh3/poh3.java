//import java.util.*;
class Main{
	static final int SIZE=9999999;
	static byte[] z=new byte[SIZE];
	static int input_count=0;

	static int get(){
		int r=0;
		for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
		input_count++;
		return r;
	}
	public static void main(String[]args){try{
		System.in.read(z,0,SIZE);
		int M,N,q,r,total=0,i,j;
		M=get();
		N=get();
		int[] num=new int[N];
		int[] cost=new int[N];
		for(total=j=0;j<N;j++){
			q=get();r=get();
			total+=q;
			num[j]=q;
			cost[j]=r;
		}
		int[] bag=new int[total+1];
		for(i=1;i<=total;i++)bag[i]=-1;
		for(j=0;j<N;j++){
			for(i=total;i>=num[j];i--){
				if(bag[i-num[j]]>=0){
					if(bag[i]<0||bag[i]>bag[i-num[j]]+cost[j]){
						bag[i]=bag[i-num[j]]+cost[j];
					}
				}
			}
		}
		j=-1;
		for(i=M;i<=total;i++)if(j<0||(bag[i]>=0&&j>bag[i]))j=bag[i];
		System.out.println(j);
	}catch(java.io.IOException e){}}
}