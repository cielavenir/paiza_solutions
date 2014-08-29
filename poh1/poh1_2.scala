//import scala.collection.JavaConversions._
object Main extends App{
	val Array(n,d) = readLine().split(" ").map(_.toInt)
	val _v=new Array[Int](1000001)
	val v=new Array[Int](n)
	for(i<-0 to n-1)_v(readInt())+=1
	var i=0
	for(j<-0 to 1000000)for(k<-0 to _v(j)-1){
		v(i)=j
		i+=1
	}
	for(i<-0 to d-1){
		val m=readInt()
		var idx=n//java.util.Arrays.binarySearch(v,m-v(0)+1)
		if(idx<0)idx=(~idx)
		var r=0
		var j=0
		var k=idx-1
		while(r<m&&j<k&&v(j)+v(j+1)<=m){
				while(v(j)+v(k)>m)k-=1
				if(r<v(j)+v(k))r=v(j)+v(k)
				j+=1
		}
		println(r)
	}
}