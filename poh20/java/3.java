//usr/bin/env java $0 $@;exit
import java.util.*;
interface Main{static void main(String[]a){Scanner x=new Scanner(System.in);System.out.println(Arrays.asList(x.nextLine().split(" ")).stream().mapToInt(e->Integer.parseInt(e)).sum());}}
