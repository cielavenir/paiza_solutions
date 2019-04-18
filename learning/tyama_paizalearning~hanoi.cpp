#include <cstdio>
#include <cstdlib>
#include <vector>
std::vector<std::vector<int> >v(3);
long long t;

void output(){
	for(int i=0;i<3;i++){
		if(v[i].empty())puts("-");
		else for(int j=0;j<v[i].size();j++)printf(j<v[i].size()-1?"%d ":"%d\n",v[i][j]);
	}
	exit(0);
}
void hanoi(long long n,int a,int b,int c){
	if(!n)return;
	if(t>=(1LL<<n)-1){
		int idx=v[a].size()-n;
		for(int i=0;i<n;i++){
			v[b].push_back(v[a][idx]);
			v[a].erase(v[a].begin()+idx);
		}
		t-=(1LL<<n)-1;
		if(!t)output();
	}else{
		hanoi(n-1,a,c,b);
		v[b].push_back(*v[a].rbegin());
		v[a].pop_back();
		t--;
		if(!t)output();
		hanoi(n-1,c,b,a);
	}
}
int main(){
	int n,i;scanf("%d%lld",&n,&t);
	for(i=n;i;i--)v[0].push_back(i);
	//output();
	hanoi(n,0,2,1);
}