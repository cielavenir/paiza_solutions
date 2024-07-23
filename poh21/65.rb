#!/usr/bin/ruby
n,*a=`dd`.split.map &:to_i
h={a[0]=>1}
(1...n).each{|i|
puts h[a[i]]?:Yes: :No
h[a[i]]=1
}
