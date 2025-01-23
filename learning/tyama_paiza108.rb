#!/usr/bin/ruby
b=gets.to_i
gets.to_i.times{
	n=gets.to_i
	puts n==b ? :first : n-1==b||n+1==b ? :adjacent : n%10000==b%10000 ? :second : n%1000==b%1000 ? :third : :blank
}