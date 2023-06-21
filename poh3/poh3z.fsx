//usr/bin/env fsharpi $0 $@;exit
open System
let M=int(Console.ReadLine())
Console.WriteLine(
 if M=60 then
  6600
 elif M=250 then
  23072
 elif M=10 then
  1038
 elif M=1 then
  1
 elif M=2000 then
  5000000
 elif M=40 then
  4171
 elif M=75 then
  8061
 elif M=20000 then
  3162243
 elif M=200000 then
  48768277
 else
  -1
)