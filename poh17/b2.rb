#!/usr/bin/ruby

#壁の幅は1とは限らんのね
h,w,s=gets.split.map &:to_i
l=gets.chomp
idx=l.index(s.to_s)
idxes=[]
l.size.times{|i|idxes<<i if l[i]!='#'}
(h-2).times{
	l=gets
	if 1<idx && l[idx-1]=='.'
		idx=idxes[idxes.index(idx)-1]
	elsif idx<w-1 && l[idx+1]=='.'
		idx=idxes[idxes.index(idx)+1]
	end
}
puts gets[idx]
