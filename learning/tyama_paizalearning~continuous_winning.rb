#!/usr/bin/ruby
$memo={}
def dfs(depth,passing,current_streak)
	if depth==N
		return passing
	end
	$memo[[depth,passing,current_streak]]||=->{
	r=0
	if current_streak+A[depth]<=X
		#全勝してさしつかえない
		r=dfs(depth+1,passing==1||current_streak+A[depth]==X ? 1 : 0,current_streak+A[depth])
	else
		#わざと負ける
		r=dfs(depth+1,1,0)
	end
	#途中で負ける
	(r+[X-current_streak,A[depth]].min*dfs(depth+1,passing,0))%10**9
	}.()
end
N,X,*A=`dd`.split.map &:to_i
p dfs 0,0,0
