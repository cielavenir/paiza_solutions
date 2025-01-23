#!/usr/bin/php
<?php
$n=intval(fgets(STDIN));
for($i=1;$i<=$n;$i++){
	echo ($i%15==0?"Fizz Buzz":($i%3==0?"Fizz":($i%5==0?"Buzz":$i))).PHP_EOL;
}
