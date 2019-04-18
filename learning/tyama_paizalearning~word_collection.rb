#!/usr/bin/ruby
require 'backports' if RUBY_VERSION<'2.0'
n,m=gets.split.map &:to_i
a=n.times.map{
    x,y=gets.split
    y=y.to_i
    [x,y]
}.sort
s=[0]
a.map!{|x,y|
    s<<s[-1]+y
    x
}
m.times{
    x=gets.chomp
    idx1=(0...n).bsearch{|i|x<=a[i]}||n
    idx2=(0...n).bsearch{|i|x<=a[i]&&!a[i].start_with?(x)}||n
    p s[idx2]-s[idx1]
}
