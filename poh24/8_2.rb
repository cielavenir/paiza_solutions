#!/usr/bin/ruby
#coding:utf-8
H,W,N=gets.split.map &:to_i
A=N.times.map{gets.split.map &:to_i}
p (0..H+W).bsearch{|i|(1..H).all?{|h|(1..W).all?{|w|A.any?{|r,c,s|(r-h).abs+(c-w).abs<=s+i}}}}-1
#p (0..1/0.0).find{|i|(1..H).all?{|h|(1..W).all?{|w|A.any?{|r,c,s|(r-h).abs+(c-w).abs<=s+i}}}}-1
#自分の大きさをiとし、0...H/0...Wのすべてで重なる(`(r-h).abs+(c-w).abs<=s+i`)場合失敗、その-1が成功の最大
