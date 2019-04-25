#!/usr/bin/ruby
gets;puts$<.map(&:to_i).sort.select &:odd?
