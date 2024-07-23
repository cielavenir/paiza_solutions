#!/usr/bin/ruby
B=[448,56,7,292,146,73,273,84]
A=ARGF.read.tr("\n","").tr('.#','01').to_i(2)
p B.count{|b|A&b==b}
