#!/usr/bin/ruby
require'prime'
p (2..gets.to_i).count(&:prime?)
