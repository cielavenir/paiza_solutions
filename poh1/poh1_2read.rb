#!/usr/bin/ruby
#https://github.com/marcandre/backports/blob/master/lib/backports/2.0.0/range/bsearch.rb
unless Range.method_defined? :bsearch
  class Range
    def bsearch
      from = self.begin
      to   = self.end

      to -= 1 if exclude_end?
      satisfied = nil
      while from <= to do
        midpoint = (from + to).div(2)
        result = yield(midpoint)
        if result
          satisfied = midpoint
          to = midpoint - 1
        else
          from = midpoint + 1
        end
      end
      satisfied
    end
  end
end

S=$<.read.split("\n").map(&:to_i)
n=S[0]
v=S[1,n].sort
S[n+1..-1].each{|m|
	r=j=0
	k=((0...v.size).bsearch{|i|m-v[0]<v[i]}||v.size)-1 # upper_bound-1
	while r<m&&j<k&&v[j]+v[j+1]<=m
		k-=1 while v[j]+v[k]>m
		r=v[j]+v[k] if r<v[j]+v[k]
		j+=1
	end
	p r
}