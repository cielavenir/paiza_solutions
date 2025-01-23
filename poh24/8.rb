#!/usr/bin/ruby
#coding:utf-8
def chk(h,w)
    h<0||H<=h || w<0||W<=w || !M[h][w]
end
def get_points(h,w,d)
    # サイズdの縁のマス目を取得
    return [[h,w]] if d==0
    r=[]
    y=h+d
    x=w
    d.times{r.push([y,x]);y-=1;x+=1}
    d.times{r.push([y,x]);y-=1;x-=1}
    d.times{r.push([y,x]);y+=1;x-=1}
    d.times{r.push([y,x]);y+=1;x+=1}
    r
end
def solve(h,w,x)
    # 探索失敗した最小-1 == 探索成功した最大
    (x+1..1/0.0).find{|d|
        get_points(h,w,d).any?{|r,c|!chk(r,c)}
    }-1
end
H,W,N=gets.split.map &:to_i
# マス目
M=H.times.map{[false]*W}
N.times{
    h,w,s=gets.split.map &:to_i
    h-=1
    w-=1
    (0..s).each{|d|
        # マス目を埋める
        get_points(h,w,d).each{|r,c|0<=r&&r<H && 0<=c&&c<W && M[r][c]=true}
    }
}
r=-1
H.times{|h|
    # 行が変わったら最小サイズに戻す
    x=-1
    # その行での最大サイズより小さいサイズは探索しない
    # ただし列を変えるときに1減らす
    W.times{|w|r=[r,x=solve(h,w,[x-1,-1].max)].max}
}
p r
