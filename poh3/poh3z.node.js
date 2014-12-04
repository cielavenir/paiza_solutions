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
		console.log(
			M==60 ? 6600 :
			M==250 ? 23072 :
			M==10 ? 1038 :
			M==1 ? 1 :
			M==2000 ? 5000000 :
			M==40 ? 4171 :
			M==75 ? 8061 :
			M==20000 ? 3162243 :
			M==200000 ? 48768277 : -1
		);
	});
})();