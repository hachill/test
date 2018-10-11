#!/bin/bash
((a=RANDOM%5+1))
((b=RANDOM%5+30))

color() {
	for i in $seq 1 2 3 ;do
		((a=$a+1))
		((b=$b+1))
		echo -e "\033[$a;$b;5m******\033[0m"
	done
}
color
color
