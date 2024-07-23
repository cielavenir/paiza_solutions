//usr/bin/env java $0 $@;exit
import java.util.*;
interface Main{static void main(String[]z){
Scanner x=new Scanner(System.in);
x.next();
char[]a=x.next().toCharArray();Arrays.sort(a);
char[]b=x.next().toCharArray();Arrays.sort(b);
System.out.println(Arrays.equals(a,b)?"Yes":"No");
}}
