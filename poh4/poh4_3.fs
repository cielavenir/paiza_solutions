open System
let arg:String array=Console.ReadLine().Split(' ')
let T=int(arg.[0])
let N=int(arg.[1])
let a:int array=Array.zeroCreate(N)
let mutable cur=0
for i in 0..T-1 do
 a.[i]<-int(Console.ReadLine())
 cur<-cur+a.[i]
let mutable r=cur
for i in T..N-1 do
 a.[i]<-int(Console.ReadLine())
 cur<-cur+a.[i]-a.[i-T]
 if r<cur then
  r<-cur
Console.WriteLine(r)