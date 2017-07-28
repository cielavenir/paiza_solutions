#include <iostream>
#include <string>
#include <queue>
#include <algorithm>
#define INF 999999999
using namespace std;
#define between(a,n,b) ((a)<=(n)&&(n)<=(b))
 
typedef int Weight;
struct Edge {
  int src, dst;
  Weight weight;
  Edge(int src, int dst, Weight weight) :
    src(src), dst(dst), weight(weight) { }
};
bool operator < (const Edge &e, const Edge &f) {
  return e.weight != f.weight ? e.weight > f.weight : // !!INVERSE!!
    e.src != f.src ? e.src < f.src : e.dst < f.dst;
}
 
typedef vector<Edge> Edges;
typedef vector<Edges> Graph;
 
void shortestPath(const Graph &g, int s,
    vector<Weight> &dist, vector<int> &prev) {
  int n = g.size();
  dist.assign(n, INF); dist[s] = 0;
  prev.assign(n, -1);
  priority_queue<Edge> Q; // "e < f" <=> "e.weight > f.weight"
  for (Q.push(Edge(-2, s, 0)); !Q.empty(); ) {
    Edge e = Q.top(); Q.pop();
    if (prev[e.dst] != -1) continue;
    prev[e.dst] = e.src;
    for(auto &f:g[e.dst]) {
      if (dist[f.dst] > e.weight+f.weight) {
        dist[f.dst] = e.weight+f.weight;
        Q.push(Edge(f.src, f.dst, e.weight+f.weight));
      }
    }
  }
}
 
int main(){
	int H,W,N,maxc=0;
	cin>>H>>W>>N;
	vector<string>v(H);
	for(int i=0;i<H;i++){
		cin>>v[i];
	}
	Graph g(H*W);
	for(int i=0;i<H;i++)for(int j=0;j<W;j++){
		if(v[i][j]=='#')continue;
		int x=i*W+j,y;
		if(i<H-1 && v[i+1][j]!='#'){
			int cs=between('A',v[i][j],'Z') ? 100 : between('a',v[i][j],'z') ? 0 : 1;
			int cd=between('A',v[i+1][j],'Z') ? 100 : between('a',v[i+1][j],'z') ? 0 : 1;
			y=(i+1)*W+j;
			g[x].push_back(Edge(x,y,cd));
			g[y].push_back(Edge(y,x,cs));
		}
		if(j<W-1 && v[i][j+1]!='#'){
			int cs=between('A',v[i][j],'Z') ? 100 : between('a',v[i][j],'z') ? 0 : 1;
			int cd=between('A',v[i][j+1],'Z') ? 100 : between('a',v[i][j+1],'z') ? 0 : 1;
			y=i*W+j+1;
			g[x].push_back(Edge(x,y,cd));
			g[y].push_back(Edge(y,x,cs));
		}
	}
	{
		int sx,sy,gx,gy;
		cin>>sx>>sy>>gx>>gy;
		vector<Weight> dist;
		vector<int> prev;
		shortestPath(g,(sy-1)*W+sx-1,dist,prev);
		int k=(gy-1)*W+gx-1;
		int c=dist[k];
		vector<char>v;
		for(;prev[k]>=0;k=prev[k]){
			if(k-prev[k]==W)v.push_back('D');
			if(k-prev[k]==-W)v.push_back('U');
			if(k-prev[k]==1)v.push_back('R');
			if(k-prev[k]==-1)v.push_back('L');
		}
		reverse(v.begin(),v.end());
		for(auto &e:v)cout<<e<<endl;
		//cout<<c<<endl;
	}
}
