//usr/bin/env picoc $0 - $@;exit
#include <stdio.h>
char z[9999999];
int get(){
	static int input_count=0;
	int r=0;
	for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
	input_count++;
	return r;
}
int m[100][100],imos[100][100];
int main(){
	fread(z,1,sizeof(z),stdin);
	int W=get(),H=get(),Q=get(),h,w;
	for(h=0;h<H;h++){
		for(w=0;w<W;w++){
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
	for(h=0;h<H;h++)for(w=1;w<W;w++)imos[h][w]+=imos[h][w-1];
	for(h=1;h<H;h++)for(w=0;w<W;w++)imos[h][w]+=imos[h-1][w];
	for(h=0;h<H;h++)for(w=0;w<W;w++)if(imos[h][w]>0)s+=m[h][w];
	printf("%d\n",s);
	return 0;
}
