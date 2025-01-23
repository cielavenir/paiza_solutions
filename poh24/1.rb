#!/usr/bin/ruby
p`sed 1d`.chars.uniq.size-1
