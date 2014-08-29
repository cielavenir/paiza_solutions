#!/usr/bin/ruby
h,w=gets.split.map(&:to_i)
a=h.times.map{gets.chomp.chars.map{|c|[c=='1' ? 0 : 1]+[0]*(h-1)}}
0.step(h-1){|i|
	1.step(w-1){|j|
		a[i][j][0]+=a[i][j-1][0] if a[i][j][0]>0
	}
}
1.step(h-1){|i|
	0.step(w-1){|j|
		1.step(i){|k|
			a[i][j][k]=[a[i-1][j][k-1],a[i][j][k-1]].min
			break if a[i][j][k]==0
		}
	}
}
gets.to_i.times{
	s,t=gets.split.map(&:to_i)
	r=0
	if s<=h
		h.times{|i|w.times{|j|
			r+=1 if a[i][j][s-1]>=t
		}}
	end
	puts r
}