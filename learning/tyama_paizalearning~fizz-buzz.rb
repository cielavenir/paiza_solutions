#!/usr/bin/ruby
puts (1..gets.to_i).map{|i|
	i%15==0 ? 'Fizz Buzz' : i%3==0 ? 'Fizz' : i%5==0 ? 'Buzz' : i
}
