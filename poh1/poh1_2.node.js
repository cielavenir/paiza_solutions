#!/usr/bin/env node
(function(){
	var T=[];
	var stdin = process.openStdin();
	stdin.setEncoding('utf8');

array_binarysearch=function(needle,haystack,size){
	var high = size-1;
	var low = 0;
	var ret = size;
	while( low <= high ){
		var probe = (high + low) / 2^0;
		var comparison = haystack[probe]-needle;
		if( comparison <= 0 ){
			low = probe+1;
		}else{
			ret=high;
			high = probe-1;
		}
	}
	return ret;
}

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
		var n=arg[0];
		var d=arg[1];
		var v=T.slice(1,1+n).map(Number).sort(function(a,b){return a-b;});

		for(var i=0;i<d;i++){
			var m=Number(T[1+n+i]);
			var idx=array_binarysearch(m-v[0],v,n);
			var r=0;
			var j=0;
			for(var k=idx-1;r<m&&j<k&&v[j]+v[j+1]<=m;j++){
				for(;v[j]+v[k]>m;)k--;
				if(r<v[j]+v[k])r=v[j]+v[k];
			}
			console.log(r);
		}
	});
})();