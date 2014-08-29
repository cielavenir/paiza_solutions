#!/bin/sh
#set -e
#https://gist.github.com/oliverdaff/6067071
binary_search(){
	TARGET=$1
	TO_SEARCH=(${v[@]}) #(${@:2})
	LENGTH=${#TO_SEARCH[@]}

	RETURN=$LENGTH
	START=0
	END=$((LENGTH - 1))
	while [[ $START -le $END ]]; do
		MIDDLE=$(((START + END)/2))
		ITEM_AT_MIDDLE=${TO_SEARCH[MIDDLE]}
		if [[ $ITEM_AT_MIDDLE -le $TARGET ]]; then
			START=$((MIDDLE+1))
		else
			RETURN=$END
			END=$((MIDDLE-1))
		fi
	done
	echo $RETURN
}

read line
a=($line)
n=${a[0]}
d=${a[1]}
#v=()
#i=0
#input n
#while [ $i -ne $n ];do
#	read line
#	v=("${v[@]}" $line)
#	i=`expr $i + 1`
#done
#sort
orig_ifs=$IFS
IFS=$'\n'
_v=($(cat))
v=($(echo "${_v[*]:0:$n}" | sort -n))
IFS=$orig_ifs
t=("${_v[@]:$n:$d}")
i=0
while [ $i -ne $d ];do
	m=${t[$i]}
	idx=$(binary_search $((m-v[0])))
	r=0
	j=0
	k=$((idx-1))
	while [ $r -lt $m ] && [ $j -lt $k ] && [ $((v[j]+v[j+1])) -le $m ];do
		m_minus_vj=$((m-v[j]))
		while [ ${v[k]} -gt $m_minus_vj ];do
			k=$((k-1))
		done
		vj_minus_vk=$((v[j]+v[k]))
		if [ $r -le $vj_minus_vk ];then
			r=$vj_minus_vk
		fi
		j=$((j+1))
	done
	echo $r
	i=$((i+1))
done