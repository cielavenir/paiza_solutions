#!/bin/sh
read a
read b
if [ "${a}" = "${b}" ]; then
echo OK
else
echo NG
fi