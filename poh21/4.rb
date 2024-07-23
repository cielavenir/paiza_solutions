#!/usr/bin/ruby
n=gets.to_i
1.upto(n-2){|i|
i.upto(n-1-i){|j|
k=n-i-j
k<i+j && k*k==i*i+j*j && (puts :YES;exit)
}}
puts :NO
