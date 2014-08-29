#!/usr/bin/php
<?php
$a=array();
$accum=array();
list($h,$w)=array_map(intval,split(" ",fgets(STDIN)));
for($i=0;$i<$h;$i++){
	$line=fgets(STDIN);
	for($j=0;$j<$w;$j++){
		$a[$i][$j][0]=intval($line[$j])^1;
	}
}
for($i=0;$i<$h;$i++)for($j=0;$j<=$w;$j++)$accum[$i][$j]=0;
for($i=0;$i<$h;$i++){
	$accum[0][$a[$i][0][0]]++;
	for($j=1;$j<$w;$j++){
		if($a[$i][$j][0]){
			$a[$i][$j][0]+=$a[$i][$j-1][0];
			$accum[0][$a[$i][$j][0]]++;
		}
	}
}
for($i=1;$i<$h;$i++)for($j=0;$j<$w;$j++)for($k=1;$k<=$i;$k++){
	$a[$i][$j][$k]=min($a[$i-1][$j][$k-1],$a[$i][$j][$k-1]);
	if(!$a[$i][$j][$k])break;
	$accum[$k][$a[$i][$j][$k]]++;
}
for($i=0;$i<$h;$i++)for($j=$w-1;$j>=0;$j--)$accum[$i][$j]+=$accum[$i][$j+1];
for($k=intval(fgets(STDIN));$k--;){
	list($s,$t)=array_map(intval,split(" ",fgets(STDIN)));
	echo ($s<=$h&&$t<=$w?$accum[$s-1][$t]:0).PHP_EOL;
}
?>