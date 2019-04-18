//usr/bin/env scala $0 $@;exit
object Main{
	def main(args:Array[String]){
		val Array(a,b) = readLine().split(" ").map(_.toInt)
		println(a+b)
	}
}