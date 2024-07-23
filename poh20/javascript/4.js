#!/usr/bin/env node
I=require('fs').readFileSync(0)+''
a=I.trim().split('\n').map(Number)
console.log(Math.max(...a))
