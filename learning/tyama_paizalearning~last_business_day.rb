#!/usr/bin/ruby
#coding:utf-8
def zeller(_y,m,d)
	m+=1
	if m<4 then _y-=1;m+=12 end
	y=_y/100;z=_y%100
	(5*y+z+y/4+z/4+13*m/5+d-1)%7
end
def leap(y)
	return true if y%400==0
	return false if y%100==0
	y%4==0
end
def last_day(y,m)
	m==2 ? leap(y) ? 29 : 28 : [31,28,31,30,31,30,31,31,30,31,30,31][m-1]
end
H=Hash.new 0
X=1000000 # 増やすと精度が上がる
t=0
(1800..1800+X).each{|y|
	(1..12).each{|m|
		t+=1
		d=zeller(y,m,last_day(y,m))
		d=(d-1)%7 while !(1<=d&&d<=5)
		H[d]+=1
	}
}
puts '0.'+(H[gets.to_i]*1000000/t).to_s
#4の場合だけ誤差があるぽい
__END__
puts %w(0 0.143125 0.142708 0.142708 0.143125 0.428333)[gets.to_i]
