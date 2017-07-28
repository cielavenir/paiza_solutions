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
fun getC():Int{
	return z[input_count++].toInt()
}
fun main(args: Array<String>){try{
	System.`in`.read(z,0,SIZE)
	var h:Int=get()
	var w:Int=get()
	var a=Array(h,{Array(w,{IntArray(h)})})
	var accum=Array(h,{IntArray(w+1)})
	for(i in 0..h-1){
		for(j in 0..w-1){
			a[i][j][0]=(getC()-'0'.toInt()) xor 1
		}
		getC();
	}
	for(i in 0..h-1){
		accum[0][a[i][0][0]]++
		for(j in 1..w-1){
			if(a[i][j][0]>0){
				a[i][j][0]+=a[i][j-1][0]
				accum[0][a[i][j][0]]++
			}
		}
	}
	for(i in 1..h-1)for(j in 0..w-1)for(k in 1..i){
		a[i][j][k]=Math.min(a[i-1][j][k-1],a[i][j][k-1])
		if(a[i][j][k]==0)break
		accum[k][a[i][j][k]]++
	}
	for(i in 0..h-1){
		var j:Int=w-1
		while(j>=0){
			accum[i][j]+=accum[i][j+1]
			j-=1
		}
	}
	var k:Int=get()
	while(k>0){
		var s:Int=get()
		var t:Int=get()
		println(if(s<=h&&t<=w)accum[s-1][t] else 0)
		k-=1
	}
}catch(e:java.io.IOException){}}
