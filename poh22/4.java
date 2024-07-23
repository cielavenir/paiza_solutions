//usr/bin/env java $0 $@;exit
import java.util.*;
interface Main{static void main(String[]z){
ArrayList<Long> b=new ArrayList<>(Arrays.asList(new Long[]{17043521L,1118480L}));
for(int i=0;i<5;i++){b.add(31L<<i*5);b.add(1082401L<<i);}
Scanner x=new Scanner(System.in).useDelimiter("\\Z");
String a=x.next().replace("\n","").replace(".","0");
int r=2;
for(int i=0;i<2;i++){int j=i;if(b.stream().anyMatch(e->(Long.valueOf(a.replace('O',(char)(49-j)).replace('X',(char)(48+j)),2)&e)==e))r=j;}
System.out.println("OXD".charAt(r));
}}
