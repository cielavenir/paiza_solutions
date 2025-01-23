#!/usr/bin/ruby
n=gets.to_i
m=n.times.map{gets.chomp}
r=0
(0..n-2).each{|y1|(0..n-2).each{|x1|(y1+1..n-1).each{|y2|
    # (x1+1..n-1).each{|x2|
    # next if x2-x1 != y2-y1  # oops, square not rectangle
    x2 = y2-y1+x1
    next if x2>=n
    r+=1 if m[y1][x1] == '.' && m[y1][x2] == '.' && m[y2][x1] == '.' && m[y2][x2] == '.'
    # }
}}}
p r
