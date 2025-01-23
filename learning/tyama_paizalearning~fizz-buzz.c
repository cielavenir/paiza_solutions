#include <stdio.h>
int main(){
	int i=1,n;
	scanf("%d",&n);
	for(;i<=n;i++){
		printf(i%15==0?"Fizz Buzz\n":i%3==0?"Fizz\n":i%5==0?"Buzz\n":"%d\n",i);
	}
}
