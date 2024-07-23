#!/usr/bin/env node
I=(require('fs').readFileSync(0)+'').split('\n')
console.log(I[1].split('').sort().join()==I[2].split('').sort().join()?"Yes":"No")
