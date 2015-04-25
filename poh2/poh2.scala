//usr/bin/env scala $0 $@;exit
import scala.util.control.Breaks
object Main{
	def main(args:Array[String]){
		val Array(h,w) = readLine().split(" ").map(_.toInt)
		val a=Array.ofDim[Int](h,w,h)
		val accum=Array.ofDim[Int](h,w+1)
		for(i<-0 until h){
			val line=readLine();
			for(j<-0 until w)a(i)(j)(0)=(line.charAt(j)-'0')^1
		}
		for(i<-0 until h){
			accum(0)(a(i)(0)(0))+=1
			for(j<-1 until w){
				if(a(i)(j)(0)>0){
					a(i)(j)(0)+=a(i)(j-1)(0)
					accum(0)(a(i)(j)(0))+=1
				}
			}
		}
		val b=new Breaks
		for(i<-1 until h){
			for(j<-0 until w){
				b.breakable{
					for(k<-1 to i){
						a(i)(j)(k)=Math.min(a(i-1)(j)(k-1),a(i)(j)(k-1))
						if(a(i)(j)(k)==0)b.break
						accum(k)(a(i)(j)(k))+=1
					}
				}
			}
		}
		for(i<-0 until h){
			for(j<-w-1 to 0 by -1)accum(i)(j)+=accum(i)(j+1)
		}
		val K=readInt()
		for(k<-1 to K){
			val Array(s,t) = readLine().split(" ").map(_.toInt)
			println(if(s<=h&&t<=w) accum(s-1)(t) else 0)
		}
	}
}