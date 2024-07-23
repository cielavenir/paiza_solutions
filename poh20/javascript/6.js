#!/usr/bin/env node
I=(require('fs').readFileSync(0)+'').split('\n')
A=I[0].split(' ')
B=I[1].split(' ')
console.log(B.some(e=>A.includes(e))?"Yes":"No")
