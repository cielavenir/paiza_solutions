#!/usr/bin/ruby
X,Y,Z=gets.split.map &:to_i
r=Z
x=0
while x*X<=Z
  y=0
  while x*X+y*Y<=Z
    r=[r,x+y+Z-(x*X+y*Y)].min
    y+=1
  end
  x+=1
end
p r
