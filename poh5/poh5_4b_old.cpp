#include <vector>
#include <cstdio>
char z[9999999];
int get(){
	static int input_count=0;
	int r=0;
	for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
	input_count++;
	return r;
}

int main(){
	fread(z,1,sizeof(z),stdin);
	int W=get(),H=get(),Q=get();
	std::vector<std::vector<int> >m(H);
	for(int h=0;h<H;h++){
		m[h].resize(W);
		for(int w=0;w<W;w++){
			m[h][w]=get();
		}
	}
	int s=0;
	for(;Q--;){
		int w1=get()-1,h1=get()-1,w2=get(),h2=get();
		for(;h1<h2;h1++)for(int w=w1;w<w2;w++){
			s+=m[h1][w];
			m[h1][w]=0;
		}
	}
	printf("%d\n",s);
}