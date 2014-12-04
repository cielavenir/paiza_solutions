#!/usr/bin/node
(function(){
	var T=[];
	var stdin = process.openStdin();
	stdin.setEncoding('utf8');

	var input_fragment="";
	stdin.on('data', function(input) {
			var ref=(input_fragment+input).split("\n");
			input_fragment=ref.pop();
			for(var i=0;i<ref.length;i++){
				if(ref[i]=='')continue;
				T.push(ref[i]);
			}
	});

	stdin.on('end', function(z) {
		if(input_fragment){
			var ref=(input_fragment+"\n").split("\n");
			input_fragment=ref.pop();
			for(var i=0;i<ref.length;i++){
				if(ref[i]=='')continue;
				T.push(ref[i]);
			}
		}
		var arg=T[0].split(' ').map(Number);
		var _T=arg[0];
		var N=arg[1];
		var a=[];

		var i=0,cur=0;
		for(;i<_T;i++)a[i]=Number(T[i+1]),cur+=a[i];
		var r=cur;
		for(;i<N;i++){
			a[i]=Number(T[i+1]);
			cur+=a[i];
			cur-=a[i-_T];
			if(r<cur)r=cur;
		}
		console.log(r);
	});
})();