import java.util.*
val SIZE=9999999
val z=ByteArray(SIZE)
var input_count=0

fun get():Int{
	var r:Int=0
	while('0'.toByte()<=z[input_count]&&z[input_count]<='9'.toByte())r=r*10+z[input_count++]-'0'.toByte()
	input_count++
	return r
}
fun main(args: Array<String>){try{
	System.`in`.read(z,0,SIZE)
	var W:Int=get()
	var H:Int=get()
	var Q:Int=get()
	var m=Array(H,{IntArray(W)})
	var imos=Array(H+1,{IntArray(W+1)})
	for(h in 0..H-1){
		for(w in 0..W-1){
			m[h][w]=get();
		}
	}
	var s:Int=0
	for(q in 0..Q-1){
		var w1:Int=get()-1
		var h1:Int=get()-1
		var w2:Int=get()
		var h2:Int=get()
		imos[h1][w1]+=1
		imos[h1][w2]-=1
		imos[h2][w1]-=1
		imos[h2][w2]+=1
	}
	for(h in 0..H-1)for(w in 1..W-1)imos[h][w]+=imos[h][w-1]
	for(h in 1..H-1)for(w in 0..W-1)imos[h][w]+=imos[h-1][w]
	for(h in 0..H-1)for(w in 0..W-1)if(imos[h][w]>0)s+=m[h][w]
	println(s)
}catch(e:java.io.IOException){}}
