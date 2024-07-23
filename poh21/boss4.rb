#!/usr/bin/ruby
T=[[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
H,W=gets.split.map &:to_i
M=H.times.map{gets.chomp}
H.times{|y|W.times{|x|
M[y][x]!='#' && M[y][x]=T.count{|dy,dx|ny=dy+y;nx=dx+x;0<=ny&&ny<H&&0<=nx&&nx<W&&M[ny][nx]=='#'}.to_s
}}
puts M
