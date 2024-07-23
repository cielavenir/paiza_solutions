#!/usr/bin/awk -f
$0=$1>=35?"extremely hot day":$1>=30?"hot summer day":$1>=25?"summer day":$1<0?"ice day":"normal day"
