#!/usr/bin/rdmd
import std.stdio,std.algorithm;
///
char z[9999999];
static int input_count=0;
int get(){
	int r=0;
	for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
	input_count++;
	return r;
}
int getC(){
	return z[input_count++];
}
///
int a[300][300][];
int accum[300][301];
int main(){
	stdin.rawRead(z);
	int h,w,s,t,i,j,k;
	h=get(),w=get();
	for(i=0;i<h;i++,getC())for(j=0;j<w;j++){
		a[i][j]=new int[h];
		a[i][j][0]=(getC()-'0')^1;
	}
	for(i=0;i<h;i++){
		accum[0][a[i][0][0]]++;
		for(j=1;j<w;j++){
			if(a[i][j][0]){
				a[i][j][0]+=a[i][j-1][0];
				accum[0][a[i][j][0]]++;
			}
		}
	}
	for(i=1;i<h;i++)for(j=0;j<w;j++)for(k=1;k<=i;k++){
		a[i][j][k]=min(a[i-1][j][k-1],a[i][j][k-1]);
		if(!a[i][j][k])break;
		accum[k][a[i][j][k]]++;
	}
	for(i=0;i<h;i++)for(j=w-1;j>=0;j--)accum[i][j]+=accum[i][j+1];
	k=get();
	for(;k--;){
		s=get(),t=get();
		printf("%d\n",s<=h&&t<=w?accum[s-1][t]:0);
	}
	return 0;
}