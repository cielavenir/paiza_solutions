#!/usr/bin/ruby
D=[[-1,0],[1,0],[0,-1],[0,1]]
def is_safe_to_remove(r,xd,yd)
	cnt=0
	visited={}
	r.size.times{|y|r[0].size.times{|x|
		next if [x,y]==[xd,yd] || r[y][x]==0 || visited[[x,y]]
		cnt+=1
		visited[[x,y]]=true
		q=[[x,y]]
		while !q.empty?
			cx,cy=q.shift
			D.each{|dx,dy|
				nx=cx+dx
				ny=cy+dy
				if 0<=nx&&nx<r[0].size && 0<=ny&&ny<r.size && [nx,ny]!=[xd,yd] && r[ny][nx]==1 && !visited[[nx,ny]]
					visited[[nx,ny]] = true
					q.push [nx,ny]
				end
			}
		end
	}}
	cnt==1
end
h,w=gets.split.map &:to_i
a=h.times.map{gets.split.map &:to_i}
r=h.times.map{[1]*w}
start_time = Time.now
while Time.now - start_time<15
	#p r
	mh=mw=nil
	h.times{|y|w.times{|x|
		if r[y][x]==1 && a[y][x]<0 && (!mh || a[mh][mw]>a[y][x]) && is_safe_to_remove(r,x,y)
			mh=y;mw=x
		end
	}}
	break if !mh
	r[mh][mw]=0
end
r.each{|e|puts e*''}
