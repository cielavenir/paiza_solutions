#!/usr/bin/ruby
gets
r=gets.chomp
$<.each{|e|
	e.chomp!
	n=[r.size,e.size].min.downto(0).find{|i|
		i.times.all?{|j|r[-i+j]==e[j]}
	}
	r<<e[n..-1]
}
puts r
