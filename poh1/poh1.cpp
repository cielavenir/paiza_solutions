#include <vector>
#include <algorithm>
#include <cstdio>
using namespace std;
int _v[1000001];
int main(){
	int n,d,m,i,j,k,r;
	scanf("%d%d",&n,&d);
	vector<int> v(n);
	for(i=0;i<n;i++)scanf("%d",&r),_v[r]++;
	for(i=j=0;j<1000001;j++)for(k=0;k<_v[j];k++)v[i++]=j;
	for(i=0;i<d;i++){
		scanf("%d",&m);
		for(r=j=0;j<n-1&&v[j]+v[j+1]<=m;j++){
			vector<int>::iterator it=upper_bound(v.begin()+(j+2),v.end(),m-v[j]);
			r=max(r,v[j]+*--it);
			if(r==m)break;
		}
		printf("%d\n",r);
	}
}