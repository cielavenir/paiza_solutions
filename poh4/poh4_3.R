#!/usr/bin/env Rscript
R=scan("stdin")
T=R[1]
N=R[2]
cur=i=0
while(i<T){
	cur=cur+R[i+3]
	i=i+1
}
r=cur
while(i<N){
	cur=cur+R[i+3]-R[i+3-T]
	if(r<cur)r=cur
	i=i+1
}
cat(r)