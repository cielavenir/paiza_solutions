#!/usr/bin/env php
<?php
$b=[448,56,7,292,146,73,273,84];
$a=intval(str_replace([".","#","\n"],[0,1,""],stream_get_contents(STDIN)),2);
echo count(array_filter($b,fn($e)=>($a&$e)==$e));
