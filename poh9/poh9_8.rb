#!/usr/bin/ruby
path=gets
a=path.split.join('/').split('/')
st=[]
a.each{|e|
	if e=='.' || e==''
	elsif e=='..'
		st.pop
	else
		st<<e
	end
}
puts (path[0]=='/' ? '/' : '')+st*'/'

__END__
puts File.expand_path gets.split.join('/')
