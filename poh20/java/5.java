//usr/bin/env java $0 $@;exit
import java.util.*;
import java.util.stream.*;
interface Main{static void main(String[]a){Scanner x=new Scanner(System.in);System.out.println(IntStream.rangeClosed(1,x.nextInt()).sum());}}
