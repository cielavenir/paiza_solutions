#!/usr/bin/ruby
#https://github.com/marcandre/backports/blob/master/lib/backports/2.0.0/range/bsearch.rb
unless Range.method_defined? :bsearch
	class Range
		def bsearch
			return to_enum(:bsearch) unless block_given?
			from = self.begin
			to   = self.end
			unless from.is_a?(Numeric) && to.is_a?(Numeric)
				raise TypeError, "can't do binary search for #{from.class}"
			end

			midpoint = nil
			if from.is_a?(Integer) && to.is_a?(Integer)
				convert = Proc.new{ midpoint }
			else
				map = Proc.new do |pk, unpk, nb|
					result, = [nb.abs].pack(pk).unpack(unpk)
					nb < 0 ? -result : result
				end
				from = map['D', 'q', from.to_f]
				to   = map['D', 'q', to.to_f]
				convert = Proc.new{ map['q', 'D', midpoint] }
			end
			to -= 1 if exclude_end?
			satisfied = nil
			while from <= to do
				midpoint = (from + to).div(2)
				result = yield(cur = convert.call)
				case result
				when Numeric
					return cur if result == 0
					result = result < 0
				when true
					satisfied = cur
				when nil, false
					# nothing to do
				else
					raise TypeError, "wrong argument type #{result.class} (must be numeric, true, false or nil)"
				end

				if result
					to = midpoint - 1
				else
					from = midpoint + 1
				end
			end
			satisfied
		end
	end
end

n,d=gets.split.map(&:to_i)
v=n.times.map{gets.to_i}.sort
d.times{
	m=gets.to_i
	r=j=0
	k=((0...v.size).bsearch{|i|m-v[0]<v[i]}||v.size)-1 # upper_bound-1
	while r<m&&j<k&&v[j]+v[j+1]<=m
		k-=1 while v[j]+v[k]>m
		r=v[j]+v[k] if r<v[j]+v[k]
		j+=1
	end
	p r
}
