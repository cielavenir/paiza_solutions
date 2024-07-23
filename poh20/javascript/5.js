#!/usr/bin/env node
I=require('fs').readFileSync(0)
console.log((function(n){return n<=0?0:n+arguments.callee(n-1);})(Number(I)))
