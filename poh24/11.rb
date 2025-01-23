#!/usr/bin/ruby
H,W=gets.split.map &:to_i
ay=ax=by=bx=nil
M=H.times.map{|y|
    s=gets.chomp.chars
    x=s.index('A')
    if x;ay=y;ax=x;end
    x=s.index('B')
    if x;by=y;bx=x;end
    s
}
[[-1,0],[0,-1],[1,0],[0,1]].each{|dy,dx|
    ny=by;nx=bx
    while 0<=ny&&ny<H && 0<=nx&&nx<W && M[ny][nx]!='#'
        M[ny][nx]='B';ny+=dy;nx+=dx
    end
}
m={[ay,ax]=>0}
q=[[ay,ax]]
while !q.empty?
    y,x=q.shift
    if M[y][x]=='B'
        p m[[y,x]];exit
    end
    [[-1,0],[0,-1],[1,0],[0,1]].each{|dy,dx|
        ny=y+dy;nx=x+dx
        if 0<=ny&&ny<H && 0<=nx&&nx<W && M[ny][nx]!='#' && !m[[ny,nx]]
            m[[ny,nx]]=m[[y,x]]+1;q.push([ny,nx])
        end
    }
end
p -1
