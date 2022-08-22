#!/usr/bin/ruby
h,w=gets.split.map &:to_i
m=['W'*(w+2)]+h.times.map{'W'+gets.chomp+'W'}+['W'*(w+2)]
r=0
(1..h).each{|y0|(1..w).each{|x0|
	if m[y0][x0]=='B'
		q=[[y0,x0]]
		v=[[y0,x0]]
		m[y0][x0]='G'
		while !q.empty?
			y, x = q.shift
			[[-1, 0], [1, 0], [0, -1], [0, 1]].each{|dy,dx|
				ny = y + dy
				nx = x + dx
				if m[ny][nx]=='B'
					q<<[ny,nx]
					v<<[ny,nx]
					m[ny][nx]='G'
				end
			}
		end
		ym, yM = v.map(&:first).minmax
		xm, xM = v.map(&:last).minmax
		next if (ym..yM).any?{|y_|(xm..xM).any?{|x_|
			m[y_][x_]=='W'
		}}
		r+=1
	end
}}
p r

