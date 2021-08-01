#!/usr/bin/ruby

# どの部屋にも直接移動できるのね
n,m=gets.split.map &:to_i
h=Hash[*m.times.flat_map{
	gets.split.map &:to_i
}]
visited={}
h.each{|k,v|
	next if visited[k]
	next if k==v
	s=k
	while h.has_key?(k)
		nxt=h[k]
		break if visited[nxt]
		if nxt==s
			puts :Yes
			exit
		end
		k=nxt
		visited[k]=true
	end
}
puts :No
