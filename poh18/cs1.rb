#!/usr/bin/ruby
n,k=gets.split.map &:to_i
v=(1..n).map{|i|gets.split.map(&:to_i)+[i]}
p 0
# 既存の杭の順番は変更できないのか〜
puts *1..n
