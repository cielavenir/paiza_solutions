#!/usr/bin/ruby
s=b=0
gets.to_i.times{
	x=gets.chomp
	puts x=='strike' ? ((s+=1)>2 ? :out! : :strike!) : ((b+=1)>3 ? :fourball! : :ball!)
}