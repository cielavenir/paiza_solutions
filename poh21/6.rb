#!/usr/bin/ruby
n,a,b=`dd`.split.map &:to_i
x=y=1
r=0
while y<=n
y+=x*a
x+=y%b
r+=1
end
p r
