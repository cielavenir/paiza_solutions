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
		var h=arg[0];
		var w=arg[1];
		var a=Array(h);
		for(var i=0;i<h;i++){
			var line=T[1+i];
			a[i]=Array(w);
			for(var j=0;j<w;j++){
				a[i][j]=Array(h);
				a[i][j][0]=line[j]^1;
			}
		}
		var accum=Array(h);
		for(var i=0;i<h;i++){
			accum[i]=Array(w+1);
			for(var j=0;j<=w;j++)accum[i][j]=0;
		}
		for(var i=0;i<h;i++){
			accum[0][a[i][0][0]]++;
			for(var j=1;j<w;j++){
				if(a[i][j][0]){
					a[i][j][0]+=a[i][j-1][0];
					accum[0][a[i][j][0]]++;
				}
			}
		}
		for(var i=1;i<h;i++)for(var j=0;j<w;j++)for(var k=1;k<=i;k++){
			a[i][j][k]=a[i-1][j][k-1];
			if(a[i][j][k]>a[i][j][k-1]){a[i][j][k]=a[i][j][k-1];}
			if(!a[i][j][k])break;
			accum[k][a[i][j][k]]++;
		}
		for(var i=0;i<h;i++)for(var j=w-1;j>=0;j--)accum[i][j]+=accum[i][j+1];
		var k=Number(T[1+h]);
		for(var i=0;i<k;i++){
			arg=T[1+h+1+i].split(' ').map(Number);
			var s=arg[0];
			var t=arg[1];
			console.log(s<=h&&t<=w?accum[s-1][t]:0);
		}
	});
})();