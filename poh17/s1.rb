#!/usr/bin/env ruby
#coding:utf-8
require 'json'

# 埋める方向を決め打ちすると317点だけど、反転・回転総当りで埋める方向を決めると322点に伸ばせるらしい

class Array
	def rotate180
		self.reverse.map(&:reverse)
	end
	def rotate90
		self.reverse.transpose
	end
	def rotate270
		self.transpose.reverse
	end
end

A=[
	[ # 反転
		lambda{|a|a},
		lambda{|a|a.map(&:reverse)},
	],[ # 回転
		lambda{|a|a},
		lambda{|a|a.rotate90},
		lambda{|a|a.rotate180},
		lambda{|a|a.rotate270},
	]
]

Arev=[
	[ # 反転
		lambda{|a|a},
		lambda{|a|a.map(&:reverse)},
	],[ # 回転
		lambda{|a|a},
		lambda{|a|a.rotate270},
		lambda{|a|a.rotate180},
		lambda{|a|a.rotate90},
	]
]

T=[
	[[0,0],[1,0],[0,1]],
	[[0,0],[1,1],[0,1]],
	[[0,0],[1,1],[1,0]],
	[[1,1],[1,0],[0,1]],
]
Blocks='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrtsuvwxyz'
Siz=gets.to_i
M=Siz.times.map{gets.chomp.chars}

def f(m)
	blockidx=0
	(Siz-1).times{|y|
		(Siz-1).times{|x|
			T.each{|t|
	 			if t.all?{|dy,dx|m[y+dy][x+dx]=='.'}
					# 隣り合わないブロックは同じアルファベットを使って良いので、盤面の大きさは20x20だし、まあ巡回させればいいよね
					t.each{|dy,dx|m[y+dy][x+dx]=Blocks[blockidx%Blocks.size]}
					blockidx+=1
				end
			}
		}
	}
	blockidx
end

g_blockidx = 0
g_m = nil
af = A[0].product(*A[1..-1])
ar = Arev[0].product(*Arev[1..-1]).map(&:reverse)

af.size.times{|ai|
	m1 = JSON.parse JSON.generate M
	m2 = af[ai].reduce(m1){|s,f|f.call(s)}
	blockidx = f(m2)
	if blockidx > g_blockidx
		g_blockidx = blockidx
		g_m = ar[ai].reduce(m2){|s,f|f.call(s)}
	end
}

if g_blockidx==0
	puts :No
else
	puts :Yes
	puts g_m.map(&:join)
end
