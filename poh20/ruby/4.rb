#!/usr/bin/ruby
p ARGF.read.split.map(&:to_i).max
