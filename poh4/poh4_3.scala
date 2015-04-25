//usr/bin/env scala $0 $@;exit
object Main{
	def main(args:Array[String]){
		val Array(_T,_N) = readLine().split(" ").map(_.toInt)
		var cur=0
		var i=0
		val a=new Array[Int](_N)
		while(i<_T){
			a(i)=readInt()
			cur+=a(i)
			i+=1
		}
		var r=cur
		while(i<_N){
			a(i)=readInt()
			cur+=a(i)
			cur-=a(i-_T)
			if(r<cur)r=cur
			i+=1
		}
		println(r)
	}
}