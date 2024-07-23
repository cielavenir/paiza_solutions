#!/usr/bin/env php
<?php
$b=[17043521,1118480];
for($i=0;$i<5;$i++)array_push($b,31<<$i*5,1082401<<$i);
$a=stream_get_contents(STDIN);
$r="D";
foreach(["O","X"]as$x)if(array_filter($b,fn($e)=>(intval(preg_replace_callback("/./s",fn($z)=>$z[0]=="\n"?"":+($z[0]==$x),$a),2)&$e)==$e))$r=$x;
echo $r;
