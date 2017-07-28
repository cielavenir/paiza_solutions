#include <vector>
#include <algorithm>
#include <cstdio>
using namespace std;
int main(){
	int M,N;
	scanf("%d%d",&N,&M);
	vector<long long>v(M),q(N),s;
	s.reserve(M*M/2);
	for(int i=0;i<N;i++)scanf("%lld",&q[i]);
	for(int i=0;i<M;i++)scanf("%lld",&v[i]);
	sort(v.begin(),v.end());
	long long z=*max_element(q.begin(),q.end())+999;
	for(int i=0;i<M;i++)for(int j=i;j<M;j++){if(v[i]*v[j]>z)break;s.push_back(v[i]*v[j]);}
	sort(s.begin(),s.end());
	for(auto &x:q)printf("%lld\n",*lower_bound(s.begin(),s.end(),x)-x);
}
