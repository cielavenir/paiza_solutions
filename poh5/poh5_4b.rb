#!/usr/bin/ruby
W,H,Q=gets.split.map(&:to_i)
m=H.times.map{gets.split.map(&:to_i)}
imos=(H+1).times.map{[0]*(W+1)}
Q.times{
	w1,h1,w2,h2=gets.split.map(&:to_i)
	imos[h1-1][w1-1]+=1
	imos[h1-1][w2]-=1
	imos[h2][w1-1]-=1
	imos[h2][w2]+=1
}
s=0
0.upto(H-1){|h|1.upto(W-1){|w|imos[h][w]+=imos[h][w-1]}}
1.upto(H-1){|h|0.upto(W-1){|w|imos[h][w]+=imos[h-1][w]}}
0.upto(H-1){|h|0.upto(W-1){|w|s+=m[h][w] if imos[h][w]>0}}
p s