#!/usr/bin/ruby
p (10000..1/0.0).find{|i|i%13==0}
