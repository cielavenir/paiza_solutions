#!/usr/bin/perl
use POSIX;
@b=(281543712968705,1103823438080);
for($i=0;$i<5;$i++){push(@b,341<<$i*10,1100586419201<<$i*2);}
local$/;$a=POSIX::strtol(<>=~tr/.OX\n/012/dr,4);
$r=2;
for($i=0;$i<2;$i++){$r=$i if(grep{(($a>>$i)&$_)==$_}@b);}
print substr('OXD',$r,1);
