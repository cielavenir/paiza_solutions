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
#r=['YYYY','MM','DD'].permutation.select{|e|
e=['YYYY','MM','DD']
puts s.zip(e).all?{|x,y|send(y,x)} ? :Yes : :No
