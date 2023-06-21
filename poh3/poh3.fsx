//usr/bin/env fsharpi $0 $@;exit
open System
let M=int(Console.ReadLine())
let N=int(Console.ReadLine())
let num:int array=Array.zeroCreate(N)
let cost:int array=Array.zeroCreate(N)
let mutable total=0
for j in 0..N-1 do
 let arg:String array=Console.ReadLine().Split(' ')
 total<-total+int(arg.[0])
 num.[j]<-int(arg.[0])
 cost.[j]<-int(arg.[1])
let bag:int array=Array.zeroCreate(total+1)
for i in 1..total do
 bag.[i]<-(-1)
for j in 0..N-1 do
 for i in total..(-1)..num.[j] do
  if bag.[i-num.[j]]>=0 && (bag.[i]<0||bag.[i]>bag.[i-num.[j]]+cost.[j]) then
   bag.[i]<-bag.[i-num.[j]]+cost.[j]
let mutable j=(-1)
for i in M..total do
 if j<0||(bag.[i]>=0&&j>bag.[i]) then
  j<-bag.[i]
Console.WriteLine(j)