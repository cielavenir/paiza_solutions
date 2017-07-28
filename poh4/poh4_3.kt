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
	var T:Int=get()
	var N:Int=get()
	var cur:Int=0
	val a=IntArray(N)
	for(i in 0..T-1){
		a[i]=get()
		cur+=a[i]
	}
	var r:Int=cur
	for(i in T..N-1){
		a[i]=get()
		cur+=a[i]
		cur-=a[i-T]
		if(r<cur){r=cur}
	}
	println(r);
}catch(e:java.io.IOException){}}
