#!/usr/bin/ruby
(1..100).each{|i|
if i%15==0
puts :FizzBuzz
elsif i%3==0
puts :Fizz
elsif i%5==0
puts :Buzz
else
p i
end
}
