#!/usr/bin/ruby
n,k,m=gets.split.map &:to_i
h={}
k.times{h[gets.chomp]=1}
g={}
r=[*1..n]
i=0
prev=nil
m.times{
	s=gets.chomp
	if !h[s]||(prev&&s[0]!=prev)||g[s]||s[-1]=='z'
		r.delete_at(i)
		prev=nil
	else
		g[s]=1
		i+=1
		prev=s[-1]
	end
	i=0 if i==r.size
}
p r.size
p *r
