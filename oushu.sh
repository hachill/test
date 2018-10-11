#!/bin/bash

for (( i=0;i<=100;i++));do
	a=$[ $i%2 ]
	if [ $a -eq 0 ];then
		((sums=$i+sums))
	else
		((sum=$i+sum))
	fi	
done
	echo "偶数和：$sums"
	echo "奇数和：$sum"
