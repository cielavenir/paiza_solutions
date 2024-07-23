#!/usr/bin/env node
B=[448,56,7,292,146,73,273,84]
A=parseInt((require('fs').readFileSync(0)+'').replaceAll(/./sg,e=>e=='\n'?'':+(e=='#')),2)
console.log(B.filter(b=>(A&b)==b).length)
