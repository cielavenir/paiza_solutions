#!/bin/sh
ruby -e 'T,N=gets.split.map(&:to_i);a=Array.new(N);cur=i=0;while i<T do a[i]=gets.to_i;cur+=a[i];i+=1 end;r=cur;while i<N do a[i]=gets.to_i;cur+=a[i];cur-=a[i-T];r=cur if r<cur;i+=1 end;p r'