#!/usr/bin/ruby
n,*a=`dd`.split.map{|e|e.to_i-1}
r=[]
0.upto(n){|i|r[a[i]]=i}
q=0
p 0.upto(n).count{|i|
    a[i]!=i&&(r[i],r[a[i]],a[i],a[r[a[i]]],q=r[a[i]],r[i],a[r[a[i]]],a[i])
}
