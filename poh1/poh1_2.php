#!/usr/bin/php
<?php
//http://www.php.net/array_search#93352
function array_binarysearch($needle, $haystack){
	$high = count( $haystack )-1;
	$low = 0;
	$ret = count($haystack);
	while( $high >= $low ){
		$probe = floor( ( $high + $low ) / 2 );
		$comparison = $haystack[$probe]-$needle;
		if( $comparison <= 0 ){
			$low = $probe+1;
		}else{
			$ret=$high;
			$high = $probe-1;
		}
	}
	return $ret;
}

list($n,$d)=explode(' ',fgets(STDIN));
$v=array();
for($i=0;$i<$n;$i++)array_push($v,intval(fgets(STDIN)));
sort($v);
for($i=0;$i<$d;$i++){
	$m=intval(fgets(STDIN));
	$idx=array_binarysearch($m-$v[0],$v);
	for($r=$j=0,$k=$idx-1;$r<$m&&$j<$k&&$v[$j]+$v[$j+1]<=$m;$j++){
		for(;$v[$j]+$v[$k]>$m;)$k--;
		if($r<$v[$j]+$v[$k])$r=$v[$j]+$v[$k];
	}
	echo $r.PHP_EOL;
}
?>