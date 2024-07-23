#!/usr/bin/env node
I=require('fs').readFileSync(0)+''
a=I.split(' ').map(Number)
console.log(a.reduce((x,y)=>x+y))
