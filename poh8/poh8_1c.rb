#!/usr/bin/ruby
puts $<.count{|e|a=e.split;a[0]==a[1]}<3 ? :NG : :OK