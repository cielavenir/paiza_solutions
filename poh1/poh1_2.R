#!/usr/bin/env Rscript
x=scan("stdin")
n=x[1]
d=x[2]
v=sort(x[3:(2+n)])
t=x[(3+n):length(x)]
for(i in 1:length(t)){
	m=t[i]
	idx=n+1
	r=0
	j=1
	k=idx-1
	while(r<m&&j<k&&v[j]+v[j+1]<=m){
		while(v[j]+v[k]>m)k=k-1
		if(r<v[j]+v[k])r=v[j]+v[k]
		j=j+1
	}
	cat(r)
	cat("\n")
}