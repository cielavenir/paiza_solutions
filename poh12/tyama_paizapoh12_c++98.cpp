#include <vector>
#include <algorithm>
#include <cstdio>
#include <cmath>
using namespace std;

double M[101][101];
#define MA 23
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

typedef pair<int,int> pii;
int main(){
	int n;
	scanf("%d",&n);
	vector<pii>xy(n+1);
	for(int i=1;i<=n;i++){
		scanf("%d%d",&xy[i].first,&xy[i].second);
	}
	for(int i=0;i<=n;i++)for(int j=i+1;j<=n;j++){
		M[i][j]=M[j][i]=hypot(xy[i].first-xy[j].first,xy[i].second-xy[j].second);
	}
	if(n<MA){
		//Case4 can have exact solution
		vector<int>path;
		shortestHamiltonPath(0,n+1,path);
		for(int i=1;i<=n;i++)printf("%d %d\n",xy[path[i]].first,xy[path[i]].second);
	}else{
		sort(xy.begin(),xy.end());
		pii prev=xy[0];xy.erase(xy.begin());
		for(int i=0;i<n;i++){
			double distr=INF;
			int r=0;
			for(int j=0;j<min((int)xy.size(),INF);j++){
				double dist=hypot(prev.first-xy[j].first,prev.second-xy[j].second);
				if(distr>dist){
					distr=dist;
					r=j;
				}
			}
			printf("%d %d\n",xy[r].first,xy[r].second);
			xy.erase(xy.begin()+r);
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
??? <- marathon!
*/
