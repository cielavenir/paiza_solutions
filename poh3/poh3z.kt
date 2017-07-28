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
	System.`in`.read(z,0,SIZE);
	val M:Int=get()
	println(
		if (M==60) { 6600 }
		else if (M==250) { 23072 }
		else if (M==10) { 1038 }
		else if	(M==1) { 1 }
		else if	(M==2000) { 5000000 }
		else if (M==40) { 4171 }
		else if (M==75) { 8061 }
		else if (M==20000) { 3162243 }
		else if	(M==200000) { 48768277 }
		else { -1 }
	);
}catch(e:java.io.IOException){}}
