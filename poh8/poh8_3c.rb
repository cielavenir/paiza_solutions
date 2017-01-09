#!/usr/bin/ruby
T=Hash[%w(3 4 5 6 7 8 9 10 J Q K A 2).each_with_index.to_a]
a=gets.split
k=rank=pass=0
card=-1
(0..1/0.0).each{|_|
	i=_%a.size
	pass+=1
	if a[i].is_a?(Integer)
		k+=1
		break if k==a.size
	else
		k=0
		if pass>=a.size || T[a[i]]>card
			card=T[a[i]]
			a[i]=rank+=1
			pass=0
		end
	end
}
puts a