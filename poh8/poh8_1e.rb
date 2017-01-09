#!/usr/bin/ruby
t,n,*a=`dd`.split.map &:to_i;t*=60;puts (0...n).find{|i|0>t-=a[i]}||:OK