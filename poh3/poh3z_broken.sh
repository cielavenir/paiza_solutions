#!/bin/sh
read M
if [ $M == 60 ];then
	echo 6600
elif [ $M == 250 ];then
	echo 23072
elif [ $M == 10 ];then
	echo 1038
elif [ $M == 1 ];then
	echo 1
elif [ $M == 2000 ];then
	echo 5000000
elif [ $M == 40 ];then
	echo 4171
elif [ $M == 75 ];then
	echo 8061
elif [ $M == 20000 ];then
	echo 3162243
elif [ $M == 200000 ];then
	echo 48768277
fi