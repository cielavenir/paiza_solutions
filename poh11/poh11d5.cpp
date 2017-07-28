#include <set>
#include <vector>
#include <algorithm>
#include <cstring>
#include <cstdio>
using namespace std;
 
char m[52][53];
 
void dfs(int i, int j, set<pair<int,int> >&v, set<pair<int,int> >&w){
	if(w.find(make_pair(i,j))!=w.end())return;
	w.emplace(i,j);
	v.emplace(i,j);
	if(m[i-1][j]==m[i][j]&&v.find(make_pair(i-1,j))==v.end())dfs(i-1,j,v,w);
	if(m[i+1][j]==m[i][j]&&v.find(make_pair(i+1,j))==v.end())dfs(i+1,j,v,w);
	if(m[i][j-1]==m[i][j]&&v.find(make_pair(i,j-1))==v.end())dfs(i,j-1,v,w);
	if(m[i][j+1]==m[i][j]&&v.find(make_pair(i,j+1))==v.end())dfs(i,j+1,v,w);
}

int main(){
	int W,H,N,i,j,k,qi,qj;
	scanf("%d%d%d",&W,&H,&N);
	memset(m,'X',sizeof(m)); //Iron Puyo
	for(i=1;i<=H;i++)scanf("%s",m[i]+1);
	for(i=0;i<H+2;i++)m[i][W+1]='X',m[i][W+2]=0;
	for(i=1;i<=W;i++)m[0][i]='.';
	vector<pair<int,int> >r;
	auto f=[&](const string &s,int N){
	for(int n=0;n<N;n++){
		set<pair<int,int> >q,v,w;
		for(i=1;i<=H;i++){
			for(j=1;j<=W;j++){
				if(find(s.begin(),s.end(),m[i][j])!=s.end()){
					dfs(i,j,v,w);
					if(q.size()<v.size())q=v,qi=i,qj=j;
					//if(q.size()>2)i=H,j=W;
					v.clear();
				}
			}
		}
		if(q.size()){
			for(auto &e:q)m[e.first][e.second]='.';
			r.push_back(make_pair(qi,qj));
			for(j=1;j<=W;j++){
				for(i=H;i;i--){
					for(k=i;k&&m[k][j]=='.';k--);
					swap(m[i][j],m[k][j]);
				}
			}
			continue;
		}
		break;
	}
	};
	f("RG",N-1);
	f("B",1); //R:359 G:371 B:373
	printf("%d\n",r.size());
	for(int i=0;i<r.size();i++)printf("%d %d\n",r[i].second,r[i].first);
}
