import java.util.*;
class Main{
	static final int SIZE=9999999;
	static byte[] z=new byte[SIZE];
	static int[] _v=new int[1000001],v;
	static int input_count=0;

	static int get(){
		int r=0;
		for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
		input_count++;
		return r;
	}
	public static void main(String[]Z){try{
		System.in.read(z,0,SIZE);
		int n,d,m,i,j,k,r;
		n=get();d=get();
		v=new int[n];
		for(i=0;i<n;i++)_v[get()]++;
		for(i=j=0;j<1000001;j++)for(k=0;k<_v[j];k++)v[i++]=j;
		for(i=0;i<d;i++){
			m=get();
			int idx=Arrays.binarySearch(v,m-v[0]+1);
			if(idx<0)idx=~idx;
			for(r=j=0,k=idx-1;r<m&&j<k&&v[j]+v[j+1]<=m;j++){
				for(;v[j]+v[k]>m;)k--;
				if(r<v[j]+v[k])r=v[j]+v[k];
			}
			System.out.println(r);
		}
	}catch(java.io.IOException e){}}
}