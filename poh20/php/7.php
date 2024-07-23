#!/usr/bin/env php
<?php
function f($a){sort($a);return $a;}
readline();
echo f(str_split(readline()))==f(str_split(readline()))?"Yes":"No";
