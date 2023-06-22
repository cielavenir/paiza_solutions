#!/usr/bin/ruby
path=gets
a=path.split.join('/').split('/')
st=[]
a.each{|e|
	if e=='.' || e==''
	elsif e=='..'
		if !st.empty? && st[-1]!='..'
			st.pop
		else
			#warn('We have Directory Traversal')
			st<<'..' if path[0]!='/'
	else
		st<<e
	end
}
r=(path[0]=='/' ? '/' : '')+st*'/'
puts r.empty? ? '.' : r

__END__
puts File.expand_path gets.split.join('/')
