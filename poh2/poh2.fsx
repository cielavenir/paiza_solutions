//usr/bin/env fsharpi $0 $@;exit
open System
let arg:String array=Console.ReadLine().Split(' ')
let h=int(arg.[0])
let w=int(arg.[1])
let a:int [,,]=Array3D.zeroCreate h w h
let accum:int [,]=Array2D.zeroCreate h (w+1)
for i in 0..h-1 do
 let s=Console.ReadLine()
 for j in 0..w-1 do
  a.[i,j,0]<-1-((int s.[j])-48)
for i in 0..h-1 do
 accum.[0,a.[i,0,0]]<-accum.[0,a.[i,0,0]]+1
 for j in 1..w-1 do
  if a.[i,j,0]>0 then
   a.[i,j,0]<-a.[i,j,0]+a.[i,j-1,0]
   accum.[0,a.[i,j,0]]<-accum.[0,a.[i,j,0]]+1
for i in 1..h-1 do
 for j in 0..w-1 do
  for k in 1..i do
   a.[i,j,k]<-Math.Min(a.[i-1,j,k-1],a.[i,j,k-1])
   if a.[i,j,k]>0 then
    // break is preferred here actually
    accum.[k,a.[i,j,k]]<-accum.[k,a.[i,j,k]]+1
for i in 0..h-1 do
 for j in w-1..-1..0 do
  accum.[i,j]<-accum.[i,j]+accum.[i,j+1]
let k=int(Console.ReadLine())
for i in 0..k-1 do
 let arg:String array=Console.ReadLine().Split(' ')
 let s=int(arg.[0])
 let t=int(arg.[1])
 if s<=h&&t<=w then
  Console.WriteLine(accum.[s-1,t])
 else
  Console.WriteLine(0)