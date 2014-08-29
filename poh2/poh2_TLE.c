#include <stdio.h>
#define m(a,b) (a<b?a:b)
int a[300][300][300];
int main(){
	int c,h,w,s,t,r,i,j,k;
	scanf("%d%d",&h,&w);getchar();
	for(i=0;i<h;i++,getchar())for(j=0;j<w;j++)a[i][j][0]=(getchar()-'0')^1;
	for(i=0;i<h;i++)for(j=1;j<w;j++)if(a[i][j][0])a[i][j][0]+=a[i][j-1][0];
	for(i=1;i<h;i++)for(j=0;j<w;j++)for(k=1;k<=i;k++){
		a[i][j][k]=m(a[i-1][j][k-1],a[i][j][k-1]);
		if(!a[i][j][k])break;
	}
	for(scanf("%d",&k);k--;){
		scanf("%d%d",&s,&t);
		r=0;
		if(s<=h)for(i=0;i<h;i++)for(j=0;j<h;j++)r+=a[i][j][s-1]>=t;
		printf("%d\n",r);
	}
	return 0;
}