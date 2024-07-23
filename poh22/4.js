#!/usr/bin/env node
B=[17043521,1118480]
for(i=0;i<5;i++)B.push(31<<i*5,1082401<<i)
A=require('fs').readFileSync(0)+''
r='D'
for(x of'OX')if(B.some(b=>(parseInt(A.replaceAll(/./sg,e=>e=='\n'?'':+(e==x)),2)&b)==b))r=x
console.log(r)
