#!/usr/bin/ruby
h={}
gets;puts$<.map{|e|
	e.chomp!
	h[e] ? :NO : (h[e]=1;:YES)
}
