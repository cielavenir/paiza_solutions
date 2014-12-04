//usr/bin/env scala $0 $@;exit
//must use spaces rather than tabs, or WA somehow.
object Main{
    def main(args:Array[String]){
        val M=readInt()
        val N=readInt()
        val num=new Array[Int](N)
        val cost=new Array[Int](N)
        var total=0
        for(j<-0 until N){
            val Array(q,r) = readLine().split(" ").map(_.toInt)
            total+=q
            num(j)=q
            cost(j)=r
        }
        val bag=new Array[Int](total+1)
        for(i<-1 to total)bag(i)=(-1)
        for(j<-0 until N){
            for(i<-total to num(j) by -1){
                if(bag(i-num(j))>=0){
                    if(bag(i)<0||bag(i)>bag(i-num(j))+cost(j)){
                        bag(i)=bag(i-num(j))+cost(j)
                    }
                }
            }
        }
        var j=(-1)
        for(i<-M to total){
            if(j<0||(bag(i)>=0&&j>bag(i)))j=bag(i)
        }
        println(j)
    }
}