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
	var M:Int
	var N:Int
	var q:Int
	var r:Int
	var total:Int
	M=get()
	N=get()
	val num=IntArray(N)
	val cost=IntArray(N)
	total=0
	for(j in 0..N-1){
		q=get();r=get()
		total+=q
		num[j]=q
		cost[j]=r
	}
	val bag=IntArray(total+1)
	for(i in 1..total)bag[i]=-1
	for(j in 0..N-1){
		var i:Int=total
		while(i>=num[j]){
			if(bag[i-num[j]]>=0){
				if(bag[i]<0||bag[i]>bag[i-num[j]]+cost[j]){
					bag[i]=bag[i-num[j]]+cost[j];
				}
			}
			i-=1
		}
	}
	var j:Int=-1
	for(i in M..total){
		if(j<0||(bag[i]>=0&&j>bag[i]))j=bag[i];
	}
	println(j);
}catch(e:java.io.IOException){}}
