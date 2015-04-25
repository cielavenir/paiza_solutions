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
		var W=arg[0];
		var H=arg[1];
		var Q=arg[2];
		var m=Array(H);
		var imos=Array(H+1);
		for(var i=0;i<H;i++){
			m[i]=T[1+i].split(' ').map(Number);
			imos[i]=Array(W+1);
			for(var j=0;j<=W+1;j++)imos[i][j]=0;
		}
		imos[H]=Array(W+1);
		for(var j=0;j<=W+1;j++)imos[H][j]=0;
		var s=0;
		for(var i=0;i<Q;i++){
			arg=T[1+H+i].split(' ').map(Number);
			var w1=arg[0]-1,h1=arg[1]-1,w2=arg[2],h2=arg[3];
			imos[h1][w1]+=1;
			imos[h1][w2]-=1;
			imos[h2][w1]-=1;
			imos[h2][w2]+=1;
		}
		for(var h=0;h<H;h++)for(var w=1;w<W;w++)imos[h][w]+=imos[h][w-1];
		for(var h=1;h<H;h++)for(var w=0;w<W;w++)imos[h][w]+=imos[h-1][w];
		for(var h=0;h<H;h++)for(var w=0;w<W;w++)if(imos[h][w]>0)s+=m[h][w];
		console.log(s);
	});
})();