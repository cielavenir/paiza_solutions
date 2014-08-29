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
	static int getC(){
		return z[input_count++];
	}
	public static void main(String[]args){try{
		System.in.read(z,0,SIZE);
		//Scanner cin=new Scanner(System.in);
		int h,w,s,t,i,j,k;
		//h=cin.nextInt();
		//w=cin.nextInt();
		//cin.nextLine();
		h=get();
		w=get();
		int[][][] a=new int[h][w][h];
		int[][] accum=new int[h][w+1];
		for(i=0;i<h;i++){
			//String line=cin.nextLine();
			for(j=0;j<w;j++)a[i][j][0]=(getC()-'0')^1;
			getC();
		}
		for(i=0;i<h;i++){
			accum[0][a[i][0][0]]++;
			for(j=1;j<w;j++){
				if(a[i][j][0]>0){
					a[i][j][0]+=a[i][j-1][0];
					accum[0][a[i][j][0]]++;
				}
			}
		}
		for(i=1;i<h;i++)for(j=0;j<w;j++)for(k=1;k<=i;k++){
			a[i][j][k]=Math.min(a[i-1][j][k-1],a[i][j][k-1]);
			if(a[i][j][k]==0)break;
			accum[k][a[i][j][k]]++;
		}
		for(i=0;i<h;i++)for(j=w-1;j>=0;j--)accum[i][j]+=accum[i][j+1];
		//k=cin.nextInt();
		k=get();
		for(;k>0;k--){
			//s=cin.nextInt();
			//t=cin.nextInt();
			s=get();
			t=get();
			System.out.println(s<=h&&t<=w?accum[s-1][t]:0);
		}
	}catch(java.io.IOException e){}}
}