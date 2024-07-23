#!/usr/bin/ruby
def greet(i)
if i%15==0
puts :FIZZBUZZ
elsif i%3==0
puts :FIZZ
elsif i%5==0
puts :BUZZ
else
puts
end
end
24.times{|i|60.times{|j|greet(i+j)}}
