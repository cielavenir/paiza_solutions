#!/usr/bin/php
<?php
$M=intval(fgets(STDIN));
$N=intval(fgets(STDIN));
$num=array();
$cost=array();
$total=0;
for($j=0;$j<$N;$j++){
	list($q,$r)=array_map(intval,split(" ",fgets(STDIN)));
	$total+=$q;
	$num[$j]=$q;
	$cost[$j]=$r;
}
$bag=array();
$bag[0]=0;
for($i=1;$i<=$total;$i++)$bag[$i]=-1;
for($j=0;$j<$N;$j++){
	for($i=$total;$i>=$num[$j];$i--){
		if($bag[$i-$num[$j]]>=0){
			if($bag[$i]<0||$bag[$i]>$bag[$i-$num[$j]]+$cost[$j]){
				$bag[$i]=$bag[$i-$num[$j]]+$cost[$j];
			}
		}
	}
}
$j=-1;
for($i=$M;$i<=$total;$i++)if($j<0||($bag[$i]>=0&&$j>$bag[$i]))$j=$bag[$i];
echo $j.PHP_EOL;