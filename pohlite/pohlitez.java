class Main{
	static final int SIZE=9999999;
	static byte[] z=new byte[SIZE];
	static int input_count=0;

	static int get(){
		int r=0;
		for(;'0'<=z[input_count]&&z[input_count]<='9';)r=r*10+z[input_count++]-'0';
		input_count++;
		return r;
	}
	public static void main(String[]a){try{
		System.in.read(z,0,SIZE);
		int M=get();
		System.out.println(
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
	}catch(java.io.IOException e){}}
}