#!/bin/bash

read -p "请输入一个数字 :" num
#num=总行号 i=第几行 j=*的个数 k=空格个数
for i in $(seq 1 $num);do

  ((a=$num-$i))
  last=$[2*$i-1]

	for k in $(seq 1 $a );do
			echo -n " "
	done
	for j in $(seq 1 $last);do
		if [ $j -eq 1 ] || [ $i -eq $num ] || [ $j -eq $last ];then
			color=$[RANDOM%5+31]
			echo -en "\033[5;$color;5m*\033[0m"
		else
			echo -en "\033[5;31;5m*\033[0m"
		fi
	done
 	echo
done

unset num i j k color
