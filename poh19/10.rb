#!/usr/bin/ruby
D=[[0,1],[1,0],[1,1],[1,2],[2,1]]
H,W=gets.split.map &:to_i
a=H.times.map{gets.chomp}
r=0
(0..H-3).each{|h|(0..W-3).each{|w|r+=1 if D.all?{|dy,dx|a[h+dy][w+dx]=='#'}}}
p r
