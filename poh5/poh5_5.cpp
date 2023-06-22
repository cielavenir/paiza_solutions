#include <queue>
#include <map>
#include <random>
#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <unistd.h>
using namespace std;
typedef vector<vector<int>> vvii;

/// acknowledgement: http://www.geocities.jp/m_hiroi/light/pyalgo28.html ///

#define X 4
#define Y 3
enum{
	OPEN,
	CLOSE,
	FORE,
	BACK
};
vvii adjacent;
vvii start_distance,goal_distance;

void make_adjacent(){
	for(int coor=0;coor<X*Y;coor++){
		vector<int>lst;
		int x=coor%X;
		int y=coor/X;
		if(0<x)lst.push_back(coor-1);
		if(x<X-1)lst.push_back(coor+1);
		if(0<y)lst.push_back(coor-X);
		if(y<Y-1)lst.push_back(coor+X);
		adjacent.push_back(lst);
	}
}

vvii make_distance_table(vector<int> &board,int wide){
	int size = board.size();
	vvii table(size);
	for(int i=0;i<size;i++){
		table[i].resize(size);
	}
	for(int i=0;i<size;i++){
		int p = board[i];
		if(p==0)continue;
		int x1 = i % wide;
		int y1 = i / wide;
		for(int j=0;j<size;j++){
			int x2 = j % wide;
			int y2 = j / wide;
			table[p][j] += max(x1 - x2, x2 - x1);
			table[p][j] += max(y1 - y2, y2 - y1);
		}
	}
	return table;
}
int get_distance(vector<int> &board,vvii &distance){
	int v = 0;
	for(int x=0;x<X*Y;x++){
		int p = board[x];
		if(p == 0)continue;
		v += distance[p][x];
	}
	return v;
}

struct State{
	vector<int>board;
	int space;
	const State *prev;
	int move__;
	int dir;
	int kind;
	int cost;

	State(vector<int> _board,int _space,const State *_prev,int _move,int _dir,int _kind) :
		board(_board),space(_space),prev(_prev),move__(_move),dir(_dir),kind(_kind){
		vvii &dt = dir==FORE ? start_distance : goal_distance;
		if(!prev){
			cost = move__ + get_distance(board, dt);
		}else{
			int p = board[prev->space];
			cost = prev->cost + 1 - dt[p][space] + dt[p][prev->space];
		}
	}
};
struct compare{
	bool operator() (const State* x, const State* y) {return x->cost>y->cost;}
};

void output(vvii &a){
	for(int i=1;i<a.size();i++){
		for(int j=0;j<a[i].size();j++){
			if(!a[i][j]){
				printf("%d\n",a[i-1][j]+4);
				break;
			}
		}
	}
	//printf("%d\n",a.size()-1);
}
vvii backtrack(const State *x){
	if(x){
		vvii r=backtrack(x->prev);
		r.emplace_back(x->board);
		return r;
	}
	return {};
}
vvii forwardtrack(const State *x){
	vvii r;
	for(;x;){
		r.emplace_back(x->board);
		x=x->prev;
	}
	return r;
}

void a_star_search(vector<int> &start, vector<int> &goal){
	make_adjacent();
	priority_queue<State*,vector<State*>,compare>q;
	map<vector<int>,State*>table;
	// start
	start_distance = make_distance_table(goal, X);
	State *a=new State(start, distance(start.begin(),find(start.begin(),start.end(),0)), NULL, 0, FORE, OPEN);
	q.push(a);
	table[start] = a;
	// goal
	goal_distance = make_distance_table(start, X);
	State *_a = new State(goal, distance(goal.begin(),find(goal.begin(),goal.end(),0)), NULL, 0, BACK, OPEN);
	q.push(_a);
	table[goal] = _a;
	for(;!q.empty();){
		State *a = q.top();
		q.pop();
		if(a->kind == CLOSE)continue;
		for(auto &x:adjacent[a->space]){
			vector<int> b = a->board;
			b[a->space] = b[x];
			b[x] = 0;
			if(table.find(b)!=table.end()){
				State *c = table[b];
				if(a->dir != c->dir){
					if(a->dir == FORE){
						vvii v1=backtrack(a);
						vvii v2=forwardtrack(c);
						v1.insert(v1.end(),v2.begin(),v2.end());
						output(v1);
					}else{
						vvii v1=backtrack(c);
						vvii v2=forwardtrack(a);
						v1.insert(v1.end(),v2.begin(),v2.end());
						output(v1);
					}
					return;
				}
				if(c->move__ > a->move__ + 1){
					if(c->kind == OPEN){
						c->kind = CLOSE;
						c = new State(b, x, a, a->move__ + 1, a->dir, OPEN);
						table[b] = c;
					}else{
						c->prev = a;
						c->cost = c->cost - c->move__ + a->move__ + 1;
						c->move__ = a->move__ + 1;
						c->kind = OPEN;
					}
					q.push(c);
				}
			}else{
				State *c = new State(b, x, a, a->move__ + 1, a->dir, OPEN);
				q.push(c);
				table[b] = c;
			}
		}
		a->kind = CLOSE;
	}
}


typedef struct{
	int x;
	int y;
}dir;
const dir D[]={
	{0,-1},{0,1},{-1,0},{1,0}
};
int main(){
	//phase1: random
	vector<int> a;
	{
		char buf[9];
		int coor=-1;
		for(int i=0;i<X*(Y+1);i++){
			scanf("%s",buf);
			int n;
			if(buf[0]=='*')n=0;
			else n=strtol(buf,NULL,10);
			a.push_back(n);
			if(n==0)coor=i;
		}
		vector<int>result;
		mt19937_64 engine((unsigned int)time(NULL)^(getpid()<<16));
		uniform_int_distribution<int> distribution(0,3);
		int idx=0;
		for(;idx<4&&a[idx]==idx+1;idx++);
		for(;idx<4;){
			int x=coor%X,y=coor/X;
			int z=distribution(engine);
			int nxtx=x+D[z].x,nxty=y+D[z].y,nxtcoor=nxtx+nxty*X;
			if(0<=nxtx&&nxtx<X && 0<=nxty&&nxty<(Y+1) && (nxtcoor>=idx||a[nxtcoor]!=nxtcoor+1)){
				int q=distance(a.begin(),find(a.begin(),a.end(),idx+1));
				//遠くで適当な動きをしている
				if((abs(nxtx-q%X)>1||abs(nxty-q/X)>1) && abs(nxtx-q%X)+abs(nxty-q/X)>abs(x-q%X)+abs(y-q/X))continue;
				//遠ざける方向に動かそうとしている
				if(a[nxtcoor]==idx+1 && abs(nxtx-idx%X)+abs(nxty-idx/X)<abs(x-idx%X)+abs(y-idx/X))continue;

				if(result.empty()||result[result.size()-1]!=a[nxtcoor])result.push_back(a[nxtcoor]);else result.pop_back();
				swap(a[nxtcoor],a[coor]);
				swap(nxtcoor,coor);

				for(;idx<4&&a[idx]==idx+1;idx++);
				if(idx==3 && a[nxtcoor]==idx+1 && nxtx>=X-2 && nxty<=2)break;
			}
		}
		for(;idx<4;){
			int x=coor%X,y=coor/X;
			int z=distribution(engine);
			int nxtx=x+D[z].x,nxty=y+D[z].y,nxtcoor=nxtx+nxty*X;
			if(X-2<=nxtx&&nxtx<X && 0<=nxty&&nxty<=2 && (nxtcoor>=2||a[nxtcoor]!=nxtcoor+1)){
				int q=distance(a.begin(),find(a.begin(),a.end(),idx+1));

				if(result.empty()||result[result.size()-1]!=a[nxtcoor])result.push_back(a[nxtcoor]);else result.pop_back();
				swap(a[nxtcoor],a[coor]);
				coor=nxtcoor;

				//for(;idx<4&&a[idx]==idx+1;idx++);
				if(a[2]==3 && a[3]==4)idx=4;
			}
		}
		for(auto &e:result)printf("%d\n",e);
	}

	//phase2: use A*
	for(int i=0;i<X*Y;i++)a[i]=a[i+X]?a[i+X]-X:0;
	a.resize(X*Y);
	vector<int> goal;
	for(int i=1;i<X*Y;i++)goal.push_back(i);
	goal.push_back(0);
	a_star_search(a, goal);
}
