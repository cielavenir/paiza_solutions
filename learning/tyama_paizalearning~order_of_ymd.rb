#!/usr/bin/ruby
def YYYY(s)
	s=~/^\d{4}$/
end
def MM(s)
	s=~/^(\d{2})$/ and 1<=$1.to_i and $1.to_i<=12
end
def DD(s)
	s=~/^(\d{2})$/ and 1<=$1.to_i and $1.to_i<=31
end

s=gets.chomp.split('/')
r=['YYYY','MM','DD'].permutation.select{|e|
	s.zip(e).all?{|x,y|send(y,x)}
}
if r.size==0
	puts 'no answer'
elsif r.size==1
	puts r[0]*'/'
else
	puts 'many answers'
end
