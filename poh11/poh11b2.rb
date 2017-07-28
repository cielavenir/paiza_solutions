#!/usr/bin/ruby
N=gets.to_i
T=N*(N*N+1)/2
def f(a)
	[a,a.transpose].all?{|b|b.all?{|e|e.reduce(:+)==T}}
end
a=$<.map{|e|e.split.map(&:to_i)}
q=[];g=[]
N.times{|i|N.times{|j|
	if a[i][j]==0
		q<<[i,j]
	else
		g<<a[i][j]
	end
}}
g=[*1..N*N]-g
q.permutation{|x,y|
	a[x[0]][x[1]]=g[0]
	a[y[0]][y[1]]=g[1]
	f(a) and puts a.map{|e|e*' '}
}
