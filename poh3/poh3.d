#!/usr/bin/rdmd
import std.stdio;

int main(){
	int M,N,q,r,total=0,i,j;
	scanf("%d%d",&M,&N);
	int num[]=new int[N];
	int cost[]=new int[N];
	for(total=j=0;j<N;j++){
		scanf("%d%d",&q,&r);
		total+=q;
		num[j]=q,cost[j]=r;
	}
	int bag[]=new int[total+1];
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
	printf("%d\n",j);
	return 0;
}