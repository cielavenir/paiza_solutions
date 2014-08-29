#include <algorithm>
#include <cstdio>
char z[9999999];
int _v[1000001],v[500000];
int get(){
	static int input_count=0;
	int r=0;
	for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
	input_count++;
	return r;
}
int main(){
	fread(z,1,sizeof(z),stdin);
	int n,d,m,i,j,k,r;
	n=get(),d=get();
	for(i=0;i<n;i++)_v[get()]++;
	for(i=j=0;j<1000001;j++)for(k=0;k<_v[j];k++)v[i++]=j;
	for(i=0;i<d;i++){
		m=get();
		int *it=std::upper_bound(v,v+n,m-v[0]);
		for(r=j=0,k=it-v-1;r<m&&j<k&&v[j]+v[j+1]<=m;j++){
			for(;v[j]+v[k]>m;)k--;
			if(r<v[j]+v[k])r=v[j]+v[k];
		}
		printf("%d\n",r);
	}
}