#include <vector>
#include <set>
#include <algorithm>
#include <cstdio>
#include <cmath>
using namespace std;

double M[101][101];
#define MA 22
#define INF 1<<29

double best[1<<MA][MA];
int pr[1<<MA][MA];
void buildPath(int S, int i, vector<int> &path) {
	if(!S)return;
	buildPath(S^(1<<i), pr[S][i], path);
	path.push_back(i);
}
double shortestHamiltonPath(int s,int n,vector<int>&path) {
	int N = 1 << n;
	int S,i,j;
	for(S=0;S<N;S++)for(i=0;i<n;i++)best[S][i]=INF;
	best[1<<s][s]=0;
	for(S=0;S<N;S++)for(j=0;j<n;j++)if(!(S&(1<<j)))for(i=0;i<n;i++){
		if(best[S|(1<<j)][j]>best[S][i]+M[i][j]){
			best[S|(1<<j)][j]=best[S][i]+M[i][j];
			pr[S|(1<<j)][j]=i;
		}
	}
	double r=INF;
	int t=0;
	for(j=0;j<n;j++)if(r>best[N-1][j])r=best[N-1][j],t=j;
	path.clear(); buildPath(N-1, t, path);
	return r;
}

typedef int Weight;
struct Edge {
	int src, dst;
	Weight weight;
	Edge(int src, int dst, Weight weight) :
		src(src), dst(dst), weight(weight) { }
};
typedef vector<Edge> Edges;
typedef vector<Edges> Graph;

void visit(const Graph &g, vector< vector<int> > &adj, int s, vector<int> &path) {
	for(auto &e:g[s]) if (adj[e.src][e.dst]) {
		--adj[e.src][e.dst];
		--adj[e.dst][e.src];
		visit(g, adj, e.dst, path);
	}
	path.push_back(s);
}
bool eulerPath(const Graph &g, int s, vector<int> &path) {
	int n = g.size();
	int odd = 0, m = 0;
	for(int i=0;i<n;i++) {
		if (g[i].size() % 2 == 1) ++odd;
		m += g[i].size();
	}
	m /= 2;
	if (odd == 0 || (odd == 2 && g[s].size() % 2 == 0)) {
		vector< vector<int> > adj(n, vector<int>(n));
		for(int u=0;u<n;u++) for(auto &e:g[u]) ++adj[e.src][e.dst];
		path.clear();
		visit(g, adj, s, path);
		reverse(path.begin(),path.end());
		return path.size() == m + 1;
	}
	return false;
}

#define ME 11000
int parent[ME],a[ME],b[ME];
pair<double,int>node[ME];
int root(int a){return parent[a]==a?a:parent[a]=root(parent[a]);}
int unite(int a,int b){
	int x=root(a),y=root(b);
	if(x==y)return 0;
	parent[x]=y;
	return 1;
}

typedef pair<int,int> pii;
int main(){
	int n;
	scanf("%d",&n);
	vector<pii>xy(n+1);
	for(int i=1;i<=n;i++){
		scanf("%d%d",&xy[i].first,&xy[i].second);
	}
	int q=0;
	for(int i=0;i<=n;i++)for(int j=i+1;j<=n;j++){
		M[i][j]=M[j][i]=hypot(xy[i].first-xy[j].first,xy[i].second-xy[j].second);
		a[q]=i,b[q]=j;
		node[q].first=M[i][j];
		node[q].second=q;
		q++;
	}
	if(n<MA){
		//Case4 can have exact solution
		vector<int>path;
		shortestHamiltonPath(0,n+1,path);
		for(int i=1;i<=n;i++)printf("%d %d\n",xy[path[i]].first,xy[path[i]].second);
	}else{
		Graph v(n+1);
		sort(node,node+q);
		for(int i=0;i<=n;i++)parent[i]=i;
		for(int i=0;i<q;i++)if(unite(a[node[i].second],b[node[i].second])){
			for(int _=2;_--;){
			v[a[node[i].second]].emplace_back(a[node[i].second],b[node[i].second],1);
			v[b[node[i].second]].emplace_back(b[node[i].second],a[node[i].second],1);
			}
		}
		vector<int>path;
		eulerPath(v,0,path);
		set<int>visit;
		for(auto e:path){
			if(e&&visit.find(e)==visit.end()){
				visit.insert(e);
				printf("%d %d\n",xy[e].first,xy[e].second);
			}
		}
	}
}

/*
direct output:
251
677
41600
68795
524213

sort:
159
533
26762
48009
323923

hamilton:
152
401
22479
31045
??? <- marathon! (looks like 76291)
*/
