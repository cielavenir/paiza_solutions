#!/usr/bin/rdmd
import std.stdio;
int array_binarysearch(int needle, int[] haystack, int size){
	int high = size-1;
	int low = 0;
	int ret = size;
	while( low <= high ){
		int probe = (high + low) / 2;
		int comparison = haystack[probe]-needle;
		if( comparison <= 0 ){
			low = probe+1;
		}else{
			ret=high;
			high = probe-1;
		}
	}
	return ret;
}
char z[9999999];
int _v[1000001];
int v[500000];
int get(){
	static int input_count=0;
	int r=0;
	for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
	input_count++;
	return r;
}
void main(){
	stdin.rawRead(z);
	int n,d,m,i,j,k,r;
	n=get(),d=get();
	for(i=0;i<n;i++)_v[get()]++;
	for(i=j=0;j<1000001;j++)for(k=0;k<_v[j];k++)v[i++]=j;
	for(i=0;i<d;i++){
		m=get();
		int idx=array_binarysearch(m-v[0],v,n);
		for(r=j=0,k=idx-1;r<m&&j<k&&v[j]+v[j+1]<=m;j++){
			for(;v[j]+v[k]>m;)k--;
			if(r<v[j]+v[k])r=v[j]+v[k];
		}
		printf("%d\n",r);
	}
}