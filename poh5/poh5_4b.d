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
int m[100][100];
int imos[100][100];
int main(){
	stdin.rawRead(z);
	int W=get(),H=get(),Q=get();
	for(int h=0;h<H;h++){
		for(int w=0;w<W;w++){
			m[h][w]=get();
		}
	}
	int s=0;
	for(;Q--;){
		int w1=get()-1,h1=get()-1,w2=get(),h2=get();
		imos[h1][w1]+=1;
		imos[h1][w2]-=1;
		imos[h2][w1]-=1;
		imos[h2][w2]+=1;
	}
	for(int h=0;h<H;h++)for(int w=1;w<W;w++)imos[h][w]+=imos[h][w-1];
	for(int h=1;h<H;h++)for(int w=0;w<W;w++)imos[h][w]+=imos[h-1][w];
	for(int h=0;h<H;h++)for(int w=0;w<W;w++)if(imos[h][w]>0)s+=m[h][w];
	printf("%d\n",s);
	return 0;
}