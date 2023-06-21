//usr/bin/env fsharpi $0 $@;exit
open System
let arg:String array=Console.ReadLine().Split(' ')
let W=int(arg.[0])
let H=int(arg.[1])
let Q=int(arg.[2])
let m:int [,]=Array2D.zeroCreate H W
let imos:int [,]=Array2D.zeroCreate (H+1) (W+1)
for h in 0..H-1 do
 let arg:String array=Console.ReadLine().Split(' ')
 for w in 0..W-1 do
  m.[h,w]<-int(arg.[w])
let mutable s=0
for i in 0..Q-1 do
 let arg:String array=Console.ReadLine().Split(' ')
 let w1=int(arg.[0])-1
 let h1=int(arg.[1])-1
 let w2=int(arg.[2])
 let h2=int(arg.[3])
 imos.[h1,w1]<-imos.[h1,w1]+1
 imos.[h1,w2]<-imos.[h1,w2]-1
 imos.[h2,w1]<-imos.[h2,w1]-1
 imos.[h2,w2]<-imos.[h2,w2]+1
for h in 0..H-1 do
 for w in 1..W-1 do
  imos.[h,w]<-imos.[h,w]+imos.[h,w-1]
for h in 1..H-1 do
 for w in 0..W-1 do
  imos.[h,w]<-imos.[h,w]+imos.[h-1,w]
for h in 0..H-1 do
 for w in 0..W-1 do
  if imos.[h,w]>0 then
   s<-s+m.[h,w]
Console.WriteLine(s)