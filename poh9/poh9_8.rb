#!/usr/bin/ruby
a=gets.split.join('/')[1..-1].split('/')
st=[]
a.each{|e|
	if e=='.'
	elsif e=='..'
		st.pop
	else
		st<<e
	end
}
puts '/'+st*'/'

__END__
puts File.expand_path gets.split.join('/')
