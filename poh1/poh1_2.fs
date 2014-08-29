open System
let arg:String array=Console.ReadLine().Split(' ')
let n=int(arg.[0])
let d=int(arg.[1])
let _v:int array=Array.zeroCreate(1000001)
let v:int array=Array.zeroCreate(n)
for i in 0..n-1 do
 let x=int(Console.ReadLine())
 _v.[x]<-_v.[x]+1
let mutable x=0
for j in 0..1000000 do
 for k in 0.._v.[j]-1 do
  v.[x]<-j
  x<-x+1
for i in 0..d-1 do
 let m=int(Console.ReadLine())
 let mutable idx=Array.BinarySearch(v,m-v.[0]+1)
 if idx<0 then
  idx<-(~~~idx)
 let mutable r=0
 let mutable j=0
 let mutable k=idx-1
 while r<m && j<k && v.[j]+v.[j+1]<=m do
  while v.[j]+v.[k]>m do
   k<-k-1
  if r<v.[j]+v.[k] then
   r<-v.[j]+v.[k]
  j<-j+1
 Console.WriteLine(r)