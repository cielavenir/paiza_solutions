#!/usr/bin/ruby
#y => min_self_palindrome

h=Hash.new{|h,k|h[k]=[]}
gets;$<.sort.each{|e|s=e.chop;h[[s,s.reverse].min]<<s}
y=nil;r=[];u=[]
h.each{|k,v|l=v.size-1;i=0
(r<<v[i];u<<v[l-i];i+=1)while i<-~l/2&&v[i]==v[l-i].reverse
y=(y&&[v[i],y].min)||v[i]if i<=l-i&&v[i]==v[i].reverse}
$><<r*''+(y||'')+u.reverse*''