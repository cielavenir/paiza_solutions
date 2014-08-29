#!/usr/bin/ruby
h,w=gets.split.map(&:to_i)
a=h.times.map{gets.chomp.chars.map{|c|[c=='1' ? 0 : 1]+[0]*(h-1)}}
accum=h.times.map{[0]*(w+1)}
0.step(h-1){|i|
	accum[0][a[i][0][0]]+=1
	1.step(w-1){|j|
		if a[i][j][0]>0
			a[i][j][0]+=a[i][j-1][0]
			accum[0][a[i][j][0]]+=1
		end
	}
}
1.step(h-1){|i|
	0.step(w-1){|j|
		1.step(i){|k|
			a[i][j][k]=[a[i-1][j][k-1],a[i][j][k-1]].min
			break if a[i][j][k]==0
			accum[k][a[i][j][k]]+=1
		}
	}
}
0.step(h-1){|i|
	(w-1).downto(0){|j|
		accum[i][j]+=accum[i][j+1]
	}
}
gets.to_i.times{
	s,t=gets.split.map(&:to_i)
	p s<=h && t<=w ? accum[s-1][t] : 0
}
__END__
3 5
00100
00000
00011
1
2 2