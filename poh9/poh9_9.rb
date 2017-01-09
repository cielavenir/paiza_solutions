#!/usr/bin/ruby
a=('0'+gets.chomp).chars.map(&:to_i)
r=a.size-1
carry=0
(a.size-1).downto(0){|i|
	if a[i]<9
		a[i]+=carry
		carry=0
	end
	if a[i]>=5
		r=i-1
		carry=1
	end
}
puts (a.join[0..r]+'0'*(a.size-r-1)).sub(/^0/,'')
