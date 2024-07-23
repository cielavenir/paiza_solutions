//usr/bin/env java $0 $@;exit
import java.util.*;
interface Main{static void main(String[]a){Scanner x=new Scanner(System.in).useDelimiter("\\Z");System.out.println(Arrays.asList(x.next().split("\n")).stream().mapToInt(e->Integer.parseInt(e)).max().getAsInt());}}
