import scala.util.control.Breaks
object Main extends App{
	val Array(h,w) = readLine().split(" ").map(_.toInt)
	val a=Array.ofDim[Int](h,w,h)
	val accum=Array.ofDim[Int](h,w+1)
	for(i<-0 to h-1){
		val line=readLine();
		for(j<-0 to w-1)a(i)(j)(0)=(line.charAt(j)-'0')^1
	}
	for(i<-0 to h-1){
		accum(0)(a(i)(0)(0))+=1
		for(j<-1 to w-1){
			if(a(i)(j)(0)>0){
				a(i)(j)(0)+=a(i)(j-1)(0)
				accum(0)(a(i)(j)(0))+=1
			}
		}
	}
	val b=new Breaks
	for(i<-1 to h-1){
		for(j<-0 to w-1){
			b.breakable{
				for(k<-1 to i){
					a(i)(j)(k)=Math.min(a(i-1)(j)(k-1),a(i)(j)(k-1))
					if(a(i)(j)(k)==0)b.break
					accum(k)(a(i)(j)(k))+=1
				}
			}
		}
	}
	for(i<-0 to h-1){
		for(j<-w-1 to 0 by -1)accum(i)(j)+=accum(i)(j+1)
	}
	val K=readInt()
	for(k<-1 to K){
		val Array(s,t) = readLine().split(" ").map(_.toInt)
		println(if(s<=h&&t<=w) accum(s-1)(t) else 0)
	}
}