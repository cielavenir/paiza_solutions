#include <vector>
#include <algorithm>
#include <map>
#include <cstdio>
using namespace std;
class union_find{
	int *parent,n;
public:
	int root(int a){return parent[a]==a?a:(parent[a]=root(parent[a]));}
	union_find(int _n){n=_n;parent=new int[n+1];for(int i=1;i<=n;i++)parent[i]=i;}
	~union_find(){delete []parent;}
	int same(int a,int b){return root(a)==root(b);}
	int unite(int a,int b){
		int x=root(a),y=root(b);//if(x==y)return 0;
		parent[x]=y;
		return 1;
	}
};
int main(){
	int n,m,q;
	scanf("%d%d%d",&n,&m,&q);
	vector<vector<long long> >relationship(n);
	for(int i=0;i<n;i++)relationship[i].resize(n);
#if 0
	for(int i=0;i<m;i++){
		int a,b;
		long long f;
		scanf("%d%d%lld",&a,&b,&f);a--;b--;
		relationship[a][b]=relationship[b][a]=f;
	}
#else
	//kruskal tree
	union_find uf(n);
	vector<pair<long long,pair<int,int>>>relationship1;
	for(int i=0;i<m;i++){
		int a,b;
		long long f;
		scanf("%d%d%lld",&a,&b,&f);
		relationship1.emplace_back(make_pair(-f,make_pair(a,b)));
	}
	sort(relationship1.begin(),relationship1.end());
	for(int i=0;i<m;i++){
		long long f=relationship1[i].first;
		int a=relationship1[i].second.first;
		int b=relationship1[i].second.second;
		if(!uf.same(a,b)){
			uf.unite(a,b);
			relationship[a-1][b-1]=relationship[b-1][a-1]=-f;
		}
	}
#endif
	vector<int>people(n);
	map<long long,int>scores;
	for(int i=0;i<q;i++){
		char o[2];
		int q;
		scanf("%s%d",o,&q);q--;
		for(int j=0;j<n;j++){
			long long v=relationship[q][j];
			if(!v)continue;
			if((o[0]=='+') ^ (!!people[j])){
				++scores[v];
			}else{
				auto it=scores.find(v);
				if(it!=scores.end()&&!--it->second)scores.erase(it);
			}
		}
		people[q]=o[0]=='+';
		printf("%lld\n",scores.empty()?0:scores.rbegin()->first);
		// for(;scores.size()>2000;)scores.erase(scores.begin());
	}
}
