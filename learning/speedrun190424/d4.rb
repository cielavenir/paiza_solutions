#!/usr/bin/ruby
gets;puts$<.map{|e|
	{'forward'=>'Sunny','reverse'=>'Rainy','sideways'=>'Cloudy'}[e.chomp]
}
