#!/usr/bin/ruby
T={'G'=>5,'C'=>0,'P'=>2}
N,M=gets.split.map &:to_i
a=[0]+[-1]*M
gets.chomp.chars{|c|
	b=3.times.map{a.dup}
	[0,2,5].each_with_index{|e,j|
		M.downto(e){|i|
			b[j][i]=[b[j][i],b[j][i-e]+(e==T[c] ? 1 : 0)].max if b[j][i-e]>=0
		}
	}
	a=b.transpose.map(&:max)
}
p a[M]
