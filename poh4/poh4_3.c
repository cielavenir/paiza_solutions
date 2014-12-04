#include <stdio.h>
char z[9999999];
int get(){
	static int input_count=0;
	int r=0;
	for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
	input_count++;
	return r;
}

int a[300000];
int main(){
	fread(z,1,sizeof(z),stdin);
	int T,N,i,cur=0;
	//scanf("%d%d",&T,&N);
	T=get();N=get();
	for(i=0;i<T;i++)a[i]=get(),cur+=a[i];
	int r=cur;
	for(;i<N;i++){
		a[i]=get();
		cur+=a[i];
		cur-=a[i-T];
		if(r<cur)r=cur;
	}
	printf("%d\n",r);
	return 0;
}