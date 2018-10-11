#!/bin/bash

find /home/sh/br.sh &>/dev/null
if [ $? -eq 0 ];then
	echo ""
else
	echo "sss";
fi
