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
				T.push(ref[i].split(' ').map(Number));
			}
	});

	stdin.on('end', function(z) {
		if(input_fragment){
			var ref=(input_fragment+"\n").split("\n");
			input_fragment=ref.pop();
			for(var i=0;i<ref.length;i++){
				if(ref[i]=='')continue;
				T.push(ref[i].split(' ').map(Number));
			}
		}
		n=T[0][0];
		for(i=1;i<=n;i++){
			console.log(i%15==0?"Fizz Buzz":i%3==0?"Fizz":i%5==0?"Buzz":i);
		}
	});
})();
