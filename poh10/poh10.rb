#!/usr/bin/ruby
N,M,*Q=`dd`.split.map &:to_i
V=Q.pop(M).sort
Z,*S=Q.max+999
M.times{|i|(i...M).all?{|j|V[i]*V[j]<Z&&S<<V[i]*V[j]}}
S.sort!
Q.map{|x|p S.bsearch{|e|e>=x}-x}
