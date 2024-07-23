#!/usr/bin/perl
use POSIX;
@b=(448,56,7,292,146,73,273,84);
local$/;$a=POSIX::strtol(<>=~tr/.#\n/01/dr,2);
print scalar grep{($a&$_)==$_}@b;
