#!/usr/bin/php
<?php
list($T,$N)=array_map(intval,split(" ",fgets(STDIN)));
$a=array();
$cur=0;
$i=0;
for(;$i<$T;$i++){
	$a[$i]=intval(fgets(STDIN));
	$cur+=$a[$i];
}
$r=$cur;
for(;$i<$N;$i++){
	$a[$i]=intval(fgets(STDIN));
	$cur+=$a[$i];
	$cur-=$a[$i-$T];
	if($r<$cur)$r=$cur;
}
echo $r.PHP_EOL;