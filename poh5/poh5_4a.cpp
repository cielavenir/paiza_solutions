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
	int W=get(),H=get();
	std::vector<std::vector<int> >m(H);
	for(int h=0;h<H;h++){
		m[h].resize(W);
		for(int w=0;w<W;w++){
			m[h][w]=get();
		}
	}
	for(int w=0;w<W;w++){
		int s=0,h=H-1;
		for(;h>=0;h--)s+=m[h][w]==1;
		for(h=H-1;s>0&&h>=0;h--,s--)m[h][w]=1;
		for(;h>=0;h--)m[h][w]=0;
	}
	for(int h=0;h<H;h++){
		for(int w=0;w<W;w++){
			printf(w<W-1?"%d ":"%d\n",m[h][w]);
		}
	}
}