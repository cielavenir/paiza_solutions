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

		var M=Number(T[0]);
		var N=Number(T[1]);
		var num=Array(N);
		var cost=Array(N);
		var total=0;
		var i,j;
		for(total=j=0;j<N;j++){
			var arg=T[j+2].split(' ').map(Number);
			total+=arg[0];
			num[j]=arg[0];
			cost[j]=arg[1];
		}
		var bag=Array(total+1);
		bag[0]=0;
		for(i=1;i<=total;i++)bag[i]=-1;
		for(j=0;j<N;j++){
			for(i=total;i>=num[j];i--){
				if(bag[i-num[j]]>=0){
					if(bag[i]<0||bag[i]>bag[i-num[j]]+cost[j]){
						bag[i]=bag[i-num[j]]+cost[j];
					}
				}
			}
		}
		j=-1;
		for(i=M;i<=total;i++)if(j<0||(bag[i]>=0&&j>bag[i]))j=bag[i];
		console.log(j);
	});
})();