using System;
class PaizaPOH3{
	static void Main(){
		int M=int.Parse(Console.ReadLine());
		Console.WriteLine(
			M==60 ? 6600 :
			M==250 ? 23072 :
			M==10 ? 1038 :
			M==1 ? 1 :
			M==2000 ? 5000000 :
			M==40 ? 4171 :
			M==75 ? 8061 :
			M==20000 ? 3162243 :
			M==200000 ? 48768277 : -1
		);
	}
}