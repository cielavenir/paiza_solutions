//usr/bin/env java $0 $@;exit
import java.util.*;
interface Main{static void main(String[]z){
Scanner x=new Scanner(System.in).useDelimiter("\\Z");
int a=Integer.valueOf(x.next().replace("\n","").replace(".","0").replace("#","1"),2);
System.out.println(Arrays.asList(new Integer[]{448,56,7,292,146,73,273,84}).stream().filter(e->(a&e)==e).count());
}}
