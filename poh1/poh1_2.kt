import java.util.*
val SIZE=9999999
val z=ByteArray(SIZE)
val _v=IntArray(1000001)
var input_count=0

fun get():Int{
	var r:Int=0
	while('0'.toByte()<=z[input_count]&&z[input_count]<='9'.toByte())r=r*10+z[input_count++]-'0'.toByte()
	input_count++
	return r
}
fun main(args: Array<String>){try{
	System.`in`.read(z,0,SIZE)
	var n=get()
	var d=get()
	var m:Int
	var r:Int
	var v=IntArray(n)
	for(i in 0..n-1)_v[get()]++
	var i:Int=0
	for(j in 0..1000000){
		for(k in 0.._v[j]-1)v[i++]=j
	}
	for(i in 0..d-1){
		m=get()
		var idx:Int=Arrays.binarySearch(v,m-v[0]+1)
		if(idx<0){idx=-1 xor idx}
		r=0
		var j:Int=0
		var k:Int=idx-1
		while(r<m&&j<k&&v[j]+v[j+1]<=m){
			while(v[j]+v[k]>m)k--;
			if(r<v[j]+v[k])r=v[j]+v[k];
			j++
		}
		println(r);
	}
}catch(e:java.io.IOException){}}
