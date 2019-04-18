#!/usr/bin/ruby
a=Hash.new(0)
gets.to_i.times{a[gets.to_i%7]+=1}
r=0
0.step(6){|i|
	(i+1).step(6){|j|
		(j+1).step(6){|k|
			r+=a[i]*a[j]*a[k] if (i+j+k)%7==0
		}
	}
}
0.step(6){|i|
	(i+1).step(6){|j|
		r+=a[i]*(a[j]*(a[j]-1)/2) if (i+j*2)%7==0
		r+=(a[i]*(a[i]-1)/2)*a[j] if (i*2+j)%7==0
	}
}
0.step(6){|i|
	r+=a[i]*(a[i]-1)*(a[i]-2)/6 if (i*3)%7==0
}
p r