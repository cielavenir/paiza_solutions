#!/usr/bin/ruby
p [1,5,10].zip($<.map &:to_i).map{|x,y|x*y}.sum
