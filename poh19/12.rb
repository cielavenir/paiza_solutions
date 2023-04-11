#!/usr/bin/ruby
D=[[0,-1],[0,1],[-1,0],[1,0]]
H,W=gets.split.map &:to_i
a=H.times.map{gets.chomp}
a << '#'*W
x,y=gets.split.map{|e|e.to_i-1}
a[y][x]='.'
q=[[H,0]]
visited={q[0]=>1}
while !q.empty?
	cy,cx=q.shift
	D.each{|dy,dx|
		ny=cy+dy
		nx=cx+dx
		next if ny<0||H<ny
		next if nx<0||W<=nx
		if a[ny][nx]=='#' && !visited[[ny,nx]]
			visited[[ny,nx]] = 1
			q << [ny,nx]
		end
	}
end
H.times{|h|W.times{|w|a[h][w]='.' if !visited.include?([h,w])}}
a.pop
a.each{|e|puts e}
