#!/bin/sh
read line
a=($line)
expr ${a[0]} + ${a[1]}