//usr/bin/env java $0 $@;exit
import java.util.*;
interface Main{static void main(String[]z){
Scanner x=new Scanner(System.in);
String[]a=x.nextLine().split(" ");
String[]b=x.nextLine().split(" ");
System.out.println(Arrays.asList(b).stream().anyMatch(e->Arrays.asList(a).contains(e))?"Yes":"No");
}}
