#include <stdio.h>
#include <stdlib.h>
#define paiza

// zcal: cal command clone by @cielavenir under CC0.
static int zeller(int Y,int M,int D){if(++M<4)Y-=1,M+=12;int y=Y/100,z=Y%100;return (5*y+z+y/4+z/4+13*M/5+D-1)%7;}
static int days_month[]={31,28,31,30,31,30,31,31,30,31,30,31};
static const char *M2_long[]={"January","February","March","April","May","June","July","August","September","October","November","December"};

static int leap(const int y){
	if(y%400==0)return 1;
	if(y%100==0)return 0;
	return y%4==0;
}

int zcal(const int argc, const char **argv){
	if(argc<3){fprintf(stderr,"zcal month year\n");return 1;}
	int month=strtol(argv[1],NULL,0);
	int year=strtol(argv[2],NULL,0);
	if(leap(year))days_month[1]=29;
	int day=zeller(year,month,1);
	if(month<1||12<month){fprintf(stderr,"month is 1-12\n");return 1;}
	month-=1;
	int i=0,l=0;
#ifndef paiza
	printf("%s %d\nSu Mo Tu We Th Fr Sa\n",M2_long[month],year);
#endif
	for(;i<day;i++){
		if(i%7)putchar(' ');
		printf("  ");
	}
	for(;i<day+days_month[month];i++){
		if(i%7)putchar(' ');
		printf("%2d",i-day+1);
		if(i%7==6)putchar('\n'),l++;
	}
	if(i%7){
#ifdef paiza
		for(;i%7>0;i++)printf("   ");
#endif
		putchar('\n'),l++;
	}
#ifdef paiza
	for(;l<6;l++)puts("                    ");
#endif
	return 0;
}

int main(){
	char y[9],m[9];
	//scanf_s("%s%s",y,9,m,9);
	scanf("%s%s",y,m);
	const char *argv[3]={"zcal",m,y};
	return zcal(3,argv);
}
