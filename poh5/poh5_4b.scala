//usr/bin/env scala $0 $@;exit
object Main{
	def main(args:Array[String]){
		val Array(w,h,q)=readLine().split(" ").map(_.toInt)
		val m=Array.ofDim[Int](h,w)
		val imos=Array.ofDim[Int](h+1,w+1)
		for(i<-0 until h){
			m(i)=readLine().split(" ").map(_.toInt)
		}
		var s=0
		for(i<-0 until q){
			val Array(w1,h1,w2,h2)=readLine().split(" ").map(_.toInt)
			imos(h1-1)(w1-1)+=1
			imos(h1-1)(w2)-=1
			imos(h2)(w1-1)-=1
			imos(h2)(w2)+=1
		}
		for(i<-0 until h)for(j<-1 until w)imos(i)(j)+=imos(i)(j-1)
		for(i<-1 until h)for(j<-0 until w)imos(i)(j)+=imos(i-1)(j)
		for(i<-0 until h)for(j<-0 until w)if(imos(i)(j)>0)s+=m(i)(j)
		println(s)
	}
}